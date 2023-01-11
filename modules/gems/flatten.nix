{ lib, ruby, groups, my }: rec {

  inherit (lib) flip mapAttrs singleton;

  genAlternatives = gemset:
    let
      mkAlts = gemName: attrs:
        let
          sources = if my.listEmpty attrs.targets then
            singleton attrs.source
          else
            attrs.targets;
        in flip builtins.map sources (source: {
          inherit (attrs) groups version;
          inherit gemName source;
        });
    in mapAttrs mkAlts gemset;
}
