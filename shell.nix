{ pkgs ? import <nixpkgs> {
  overlays = [ (import ./modules/overlays/ruby-overlay.nix) ];
}, bundix }:
let
  rubyNix = (import ./default.nix bundix) pkgs;
  inherit (rubyNix {
    name = "rubynix-test";
    gemset = ./tests/multi_app/gemset.nix;
  })
    env ruby;
in pkgs.mkShell {
  buildInputs = [ ruby env ] ++ (with pkgs; [ rnix-lsp nixfmt ]);
}
