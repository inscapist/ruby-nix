{ lib, ruby, groups }:
rec {
  inherit (lib) attrValues concatMap converge
    filterAttrs getAttrs intersectLists;

  # strictlyMatched is a smaller set that meets all the gem conditions.
  # with converge, we expand it to make sure that all dependencies(closure) are met
  filterGemset = gemset:
    let
      platformGems = filterAttrs (_: platformMatches ruby) gemset;
      allowedGems = filterAttrs (_: notLocalGems) platformGems;
      strictlyMatched = filterAttrs (_: groupMatches groups) allowedGems;

      expandDependencies = gems:
        let
          depNames = concatMap (gem: gem.dependencies or [ ])
            (attrValues gems);
          deps = getAttrs depNames allowedGems;
        in
        gems // deps;
    in
    # build a set of the closure of needed gems
    converge expandDependencies strictlyMatched;

  # some gems are platform specific (eg. x86_64-linux)
  platformMatches = { rubyEngine, version, ... }: attrs: (
    !(attrs ? platforms) ||
    builtins.length attrs.platforms == 0 ||
    builtins.any
      (platform:
        platform.engine == rubyEngine &&
        (!(platform ? version) || platform.version == version.majMin)
      )
      attrs.platforms
  );

  # respect gem grouping specified in Gemfile
  groupMatches = groups: attrs:
    groups == null || !(attrs ? groups) ||
    (intersectLists (groups ++ [ "default" ]) attrs.groups) != [ ];

  # remove local gems
  notLocalGems = attrs: attrs.source.type != "path";
}
