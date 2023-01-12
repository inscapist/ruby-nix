{ lib, ruby, document, gemConfig, my, ... }:

with builtins;
with lib; rec {

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
  #
  # XXX as of writing, I am not sure we should just pick 1 version,
  # or to test whether wrap each version in a derivation where the
  # executable files are tested fine, which isn't a great assumption
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
