{ pkgs ? import <nixpkgs> {
    overlays = [ (import ./modules/overlays/ruby-overlay.nix) ];
  }
, bundix
}:
let
  rubyNix = (import ./default.nix bundix) pkgs;
  inherit (rubyNix {
    name = "rubynix-test";
    gemset = ./tests/tiny_app/gemset.nix;
  }) env envMinimal ruby;
in
pkgs.mkShell {
  buildInputs = [ ruby ] ++
    (with pkgs; [ rnix-lsp nixfmt ]);
}
