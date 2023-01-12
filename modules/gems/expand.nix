{ lib, ruby, document, gemConfig, my, ... }: rec {

  inherit (builtins) map;
  inherit (lib) mapAttrs pipe singleton;

  # `config` is a set of functions with the same keys as `attrs`
  # This is a useful pattern to modify a set
  applyConfig = attrs:
    let
      f = gemConfig.${attrs.gemName};
      apply = (gemConfig ? ${attrs.gemName}) && attrs.compile;
    in if apply then attrs // f attrs else attrs;

  applyGemConfig = _: alts: map applyConfig alts;

  # final cleanup
  cleanup = _: alts: map (x: removeAttrs x [ "compile" ]) alts;

  # construct gem spec used by `buildRubyGem`
  eachSource = gemName: attrs: source:
    (removeAttrs attrs [ "targets" "platforms" ]) // {
      inherit gemName ruby document;
      inherit (source) type compile;

      dependencies = attrs.dependencies or [ ];
      source = { inherit (source) remotes sha256; };

      version = if source ? target then
        "${attrs.version}-${source.target}"
      else
        attrs.version;
    };

  # create all possible gems due to platform versions
  # eg. universal-darwin-20, universal-darwin-21
  mapAlts = gemName: attrs:
    let
      sources = if attrs.targets == [ ] then
        singleton (attrs.source // { compile = true; })
      else
        map (a: a // { compile = false; }) attrs.targets;
    in map (eachSource gemName attrs) sources;

  mapGemsetVersions = gemset:
    pipe gemset [
      (mapAttrs mapAlts)
      (mapAttrs applyGemConfig)
      (mapAttrs cleanup)
    ];
}
