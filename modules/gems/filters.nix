{ lib, ruby, groups, ... }: rec {
  inherit (lib)
    attrValues concatMap converge filterAttrs mapAttrs getAttrs intersectLists
    hasPrefix hasSuffix hasInfix;

  # ignore local gems
  notLocalGems = attrs: (attrs.source.type or "") != "path";

  # there are various ruby platforms, MRI, jruby, truffleruby..
  platformMatches = { rubyEngine, version, ... }:
    attrs:
    (!(attrs ? platforms) || builtins.length attrs.platforms == 0
      || builtins.any (platform:
        platform.engine == rubyEngine
        && (!(platform ? version) || platform.version == version.majMin))
      attrs.platforms);

  # respect gem grouping specified in Gemfile
  groupMatches = attrs:
    groups == null || !(attrs ? groups)
    || (intersectLists (groups ++ [ "default" ]) attrs.groups) != [ ];

  # https://github.com/rubygems/rubygems/blob/master/lib/rubygems/platform.rb
  targetMatches = _: attrs:
    let
      matcher = t:
        let
          inherit (ruby.stdenv.hostPlatform)
            is32bit is64bit isAarch isDarwin isWindows isLinux isMinGW isCygwin;

          cpu = t.targetCPU or null;
          os = t.targetOS or null;

          universal = cpu == null || cpu == "universal";
          armBased = builtins.any (s: hasInfix s cpu) [ "arm" "amd" "aarch" ];
          instructionMatch = (isAarch && armBased) || !(isAarch || armBased);

          archMatch = (is64bit && (hasSuffix "64" cpu))
            || (is32bit && (hasSuffix "86" cpu));

          osMatch = (isDarwin && os == "darwin") || (isLinux && os == "linux")
            || (isWindows && hasPrefix "mswin" os)
            || (isMinGW && hasPrefix "mingw" os)
            || (isCygwin && hasPrefix "cygwin" os);
        in (universal || (instructionMatch && archMatch)) && osMatch;

      targets = builtins.filter matcher (attrs.targets or [ ]);
    in (builtins.removeAttrs attrs [ "targets" ]) // { inherit targets; };

  # with converge, we expand it to make sure that all dependencies(closure) are met
  filterGemset = gemset:
    let
      installables = filterAttrs (_: notLocalGems) gemset;
      platformMatched = filterAttrs (_: platformMatches ruby) installables;
      groupMatched = filterAttrs (_: groupMatches) platformMatched;

      ensureDeps = gems:
        let
          depNames = concatMap (gem: gem.dependencies or [ ]) (attrValues gems);
          deps = getAttrs depNames platformMatched;
        in gems // deps;
      converged = converge ensureDeps groupMatched;

    in mapAttrs targetMatches converged;
}
