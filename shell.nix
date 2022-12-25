{ pkgs ? import <nixpkgs> { } }:
let
  rubyNix = import ./default.nix pkgs;
  inherit (rubyNix {
    name = "rubynix-test";
    gemset = ./tests/tiny_app/gemset.nix;
  })
    rubyEnv;
in
pkgs.mkShell {
  buildInputs = [ rubyEnv rubyEnv.ruby ] ++
    (with pkgs; [ rnix-lsp nixfmt bundix ]);
}
