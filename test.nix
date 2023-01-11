{ pkgs ? import <nixpkgs> { } }:

let
  inherit (pkgs) lib ruby defaultGemConfig;

  requirements = (pkgs // {
    inherit ruby gempaths;
    name = "test-ruby-nix";
    my = import ./mylib.nix pkgs;
    bundler = pkgs.bundler.override { inherit ruby; };
    mybundix = import pkgs.bundix { inherit pkgs ruby bundler; };
    gemConfig = defaultGemConfig;
    groups = null;
    document = [ ];
    extraRubySetup = null;
    gemset = import ./tests/multi_app/gemset.nix;
  });

  gems = import ./modules/gems requirements;
  gempaths = lib.attrValues gems;
in gems
