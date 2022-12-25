{ pkgs ? import <nixpkgs> { } }:
let
  rubyNix = import ./default.nix pkgs;
  inherit (rubyNix {
    name = "rubynix-test";
    gemset = ./tests/tiny_app/gemset.nix;
  }) env;
in
pkgs.mkShell {
  buildInputs = [ env ] ++
    (with pkgs; [ rnix-lsp nixfmt ]);
}
