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
  inherit (import ./gemset-filter.nix { inherit lib ruby groups; })
    filterGemset;

  applyGemConfig = my.applyConfig gemConfig;

  # XXX: Improve this code's readability
  finalGemSpec = ruby: gems: name: attrs:
    let matchingSource =
      lib.findFirst
        (p:
          let sys = ruby.stdenv.hostPlatform.system; in
          (
            # to find whether there is a matching precompiled gem for this platform
            if lib.hasPrefix "arm64-darwin" p.platform then sys == "aarch64-darwin"
            else if lib.hasPrefix "x86_64-darwin" p.platform then sys == "x86_64-darwin"
            else if p.platform == "x86_64-linux" then sys == "x86_64-linux"
            else false
          )
        )
        # falls back to source compilation otherwise
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
    buildRubyGem (finalGemSpec ruby gems name attrs);

  gemset' = mapAttrs
    (name: attrs:
      applyGemConfig (attrs //
        { inherit ruby document; gemName = name; })
    )
    (filterGemset gemset);

  gems = mapAttrs buildGem gemset';
in
gems
