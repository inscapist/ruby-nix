{ lib, ruby, document, gemConfig, my }: rec {

  inherit (lib) flip mapAttrs singleton findFirst;
  inherit (builtins) map;

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

  # create all possible gems due to platform versions (universal-darwin-20, universal-darwin-21)
  mkAlts = gemName: attrs:
    let
      sources = if my.listEmpty attrs.targets then
        singleton (attrs.source // { compile = true; })
      else
        map (a: a // { compile = false; }) attrs.targets;
    in flip map sources (source: {
      inherit gemName ruby document;
      inherit (attrs) groups version;
      inherit (source) type compile;
      source = { inherit (source) remotes sha256; };
    });

  # main function
  possibleGems = gemset:
    let
      alts = mapAttrs mkAlts gemset;
      withConfig = mapAttrs applyGemConfig alts;
      final = mapAttrs cleanup withConfig;
    in final;

}
