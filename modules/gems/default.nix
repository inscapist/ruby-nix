{ lib, ruby, gemset, buildRubyGem, ... }@args:

with builtins;
with lib; rec {

  # captures matching gem versions(variants)
  gemsetVersions = let
    inherit (import ./filters.nix args) filterGemset;
    inherit (import ./expand.nix args) mapGemsetVersions;
  in pipe gemset [ filterGemset mapGemsetVersions ];

  # XXX select the most specific gem version to install
  selected = flip mapAttrs gemsetVersions (_: versions:
    let
      moreSpecific = a: b:
        if stringLength a.version > stringLength b.version then a else b;
    in foldl moreSpecific (head versions) versions);

  # `gemPath` will be passed to `propagatedBuildInputs` and
  # `propagatedUserEnvPkgs` of the gem derivation
  applyDependencies = spec:
    spec // {
      gemPath = map (d: gems.${d}) spec.dependencies;
    };

  # for debugging, remove buildRubyGem
  gems = flip mapAttrs selected
    (_: spec: pipe spec [ applyDependencies buildRubyGem ]);

  gemPaths = attrValues gems;
}
