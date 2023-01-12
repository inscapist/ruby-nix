{ lib, ruby, gemset, buildRubyGem, ... }@args:

let
  inherit (builtins) map;
  inherit (lib) flip pipe mapAttrs concatMap;

  # captures matching gem versions(variants)
  gemsetVersions = let
    inherit (import ./filters.nix args) filterGemset;
    inherit (import ./expand.nix args) mapGemsetVersions;
  in pipe gemset [ filterGemset mapGemsetVersions ];

  # `gemPath` will be passed to `propagatedBuildInputs` and
  # `propagatedUserEnvPkgs` of the gem derivation
  applyDependencies = spec:
    spec // {
      gemPath = concatMap (d: gems.${d}) spec.dependencies;
    };

  gems = flip mapAttrs gemsetVersions
    (_: versions: pipe versions [ (map applyDependencies) (map buildRubyGem) ]);

  gemPaths = pipe gems (with lib; [ attrValues (concatMap id) ]);

in { inherit gems gemPaths; }
