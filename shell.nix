{ pkgs, bundix }:
let
  rubyNix = (import ./default.nix bundix) pkgs;
  inherit (rubyNix {
    name = "rubynix-test";
    gemset = ./tests/tiny_app/gemset.nix;
  })
    env ruby;
in pkgs.mkShell { buildInputs = [ ruby env ] ++ (with pkgs; [ nix nixfmt ]); }
