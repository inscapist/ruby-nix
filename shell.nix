{ pkgs ? import <nixpkgs> { } }:
let
  rubyNix = import ./default.nix pkgs;
  inherit (rubyNix {
    name = "rubynix-test";
    gemset = ./tests/tiny_app/gemset.nix;
  }) env envMinimal;
in
pkgs.mkShell {
  buildInputs = [ envMinimal ] ++
    (with pkgs; [ rnix-lsp nixfmt ]);
}
