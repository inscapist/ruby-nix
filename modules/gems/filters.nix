{ lib, ruby, groups }: rec {
  inherit (lib)
    attrValues concatMap converge filterAttrs mapAttrs getAttrs intersectLists
    hasPrefix hasSuffix;

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
  groupMatches = groups: attrs:
    groups == null || !(attrs ? groups)
    || (intersectLists (groups ++ [ "default" ]) attrs.groups) != [ ];

  # https://github.com/rubygems/rubygems/blob/master/lib/rubygems/platform.rb
  targetMatches = name: attrs:
    let
      matcher = t:
        let
          inherit (ruby.stdenv.hostPlatform)
            is32bit is64bit isAarch32 isAarch64 isDarwin isWindows isLinux
            isMinGW isCygwin;

          c = t.targetCPU;
          o = t.targetOS;

          cpuMatch = c == null || c == "universal"
            || ((is64bit || isAarch64) && (hasSuffix "64" c))
            || ((is32bit || isAarch32) && (hasSuffix "86" c));

          osMatch = (isDarwin && o == "darwin") || (isLinux && o == "linux")
            || (isWindows && hasPrefix "mswin" o)
            || (isMinGW && hasPrefix "mingw" o)
            || (isCygwin && hasPrefix "cygwin" o);
        in cpuMatch && osMatch;

      targets = builtins.filter matcher (attrs.targets or [ ]);
    in (builtins.removeAttrs attrs [ "targets" ]) // { inherit targets; };

  # with converge, we expand it to make sure that all dependencies(closure) are met
  filterGemset = gemset:
    let
      installables = filterAttrs (_: notLocalGems) gemset;
      platformMatched = filterAttrs (_: platformMatches ruby) installables;
      groupMatched = filterAttrs (_: groupMatches groups) platformMatched;

      ensureDeps = gems:
        let
          depNames = concatMap (gem: gem.dependencies or [ ]) (attrValues gems);
          deps = getAttrs depNames platformMatched;
        in gems // deps;
      converged = converge ensureDeps groupMatched;

    in mapAttrs targetMatches converged;
}
