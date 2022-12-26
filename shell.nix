{ pkgs ? import <nixpkgs> { }
, bundix
}:
let
  rubyNix = (import ./default.nix bundix) pkgs;
  inherit (rubyNix {
    name = "rubynix-test";
    gemset = ./tests/tiny_app/gemset.nix;
  }) env envMinimal;
in
pkgs.mkShell {
  buildInputs = [ env ] ++
    (with pkgs; [ rnix-lsp nixfmt ]);
}
