{ lib
, my
, ruby
, groups
, document
, gemset
, gemConfig
, buildRubyGem
, ...
}:

let
  inherit (lib) mapAttrs;
  inherit (import ./gemset-resolver.nix { inherit lib ruby groups; })
    resolveGemset;

  applyGemConfig = my.applyConfig gemConfig;

  finalGemAttrs = ruby: gems: name: attrs:
    ((removeAttrs attrs [ "platforms" ]) // {
      inherit ruby;
      inherit (attrs.source) type;
      source = removeAttrs attrs.source [ "type" ];
      gemName = name;
      # equivalent to buildInputs
      gemPath = map (gemName: gems.${gemName}) (attrs.dependencies or [ ]);
    });

  buildGem = name: attrs:
    buildRubyGem (finalGemAttrs ruby gems name attrs);

  gemset' = mapAttrs
    (name: attrs:
      applyGemConfig (attrs //
        { inherit ruby document; gemName = name; })
    )
    (resolveGemset gemset);

  gems = mapAttrs buildGem gemset';
in
gems
