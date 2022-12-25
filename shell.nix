{ pkgs ? import <nixpkgs> { } }:
let
  rubyNix = import ./default.nix pkgs;
  inherit (rubyNix {
    name = "rubynix-test";
    gemset = ./tests/tiny_app/gemset.nix;
  }) rubyEnv ruby;
in
pkgs.mkShell {
  buildInputs = [ rubyEnv ruby ] ++
    (with pkgs; [ rnix-lsp nixfmt bundix ]);
}
