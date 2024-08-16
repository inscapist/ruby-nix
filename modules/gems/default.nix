{
  lib,
  ruby,
  gemset,
  buildRubyGem,
  ...
}@args:

with builtins;
with lib;
rec {

  # captures matching gem versions(variants)
  gemsetVersions =
    let
      inherit (import ./filters.nix args) filterGemset;
      inherit (import ./expand.nix args) mapGemsetVersions;
    in
    pipe gemset [
      filterGemset
      mapGemsetVersions
    ];

  # `gemPath` will be passed to `propagatedBuildInputs` and
  # `propagatedUserEnvPkgs` of the gem derivation
  applyDependencies = spec: spec // { gemPath = concatMap (d: gems.${d}) spec.dependencies; };

  gems = flip mapAttrs gemsetVersions (
    _: versions:
    pipe versions [
      (map applyDependencies)
      (map (spec: buildRubyGem (spec // { inherit ruby; })))
    ]
  );

  gempaths = pipe gems (
    with lib;
    [
      attrValues
      (concatMap id)
    ]
  );
}
