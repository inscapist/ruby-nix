{ pkgs ? import <nixpkgs> {
  overlays = [ (import ./modules/overlays/ruby-overlay.nix) ];
}, bundix }:
let
  rubyNix = (import ./default.nix bundix) pkgs;
  inherit (rubyNix {
    name = "rubynix-test";
    gemset = ./tests/multi_app/gemset.nix;
  })
    env;
in pkgs.mkShell {
  buildInputs = [ env.ruby env ] ++ (with pkgs; [ nix nixfmt ]);
}
