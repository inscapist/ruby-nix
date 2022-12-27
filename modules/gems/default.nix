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
    let matchingSource = lib.findFirst
      (p:
        if lib.hasPrefix "arm64-darwin" p.platform then ruby.stdenv.hostPlatform.system == "aarch64-darwin"
        else if lib.hasPrefix "x86_64-darwin" p.platform then ruby.stdenv.hostPlatform.system == "x86_64-darwin"
        else if p.platform == "x86_64-linux" then ruby.stdenv.hostPlatform.system == "x86_64-linux"
        else false
      )
      attrs.source
      (attrs.nativeSources or [ ]);
    in
    ((removeAttrs attrs [ "platforms" "nativeSources" ]) // {
      inherit ruby;
      inherit (matchingSource) type;
      source = removeAttrs matchingSource [ "type" "platform" ];
      gemName = name;
      gemPath = map (gemName: gems.${gemName}) (attrs.dependencies or [ ]);
      version =
        if (matchingSource.platform or "ruby") == "ruby" then
          attrs.version else "${attrs.version}-${matchingSource.platform}";
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
