{ pkgs ? import <nixpkgs> { } }:

let
  inherit (pkgs) lib ruby defaultGemConfig;

  requirements = (pkgs // rec {
    inherit ruby gempaths;
    name = "test-ruby-nix";
    my = import ./mylib.nix pkgs;
    bundler = pkgs.bundler.override { inherit ruby; };
    mybundix = import pkgs.bundix { inherit pkgs ruby bundler; };
    gemConfig = defaultGemConfig // {
      sorbet-static = _: { buildFlags = [ "--invalid-flag" ]; };
    };
    groups = null;
    document = [ ];
    extraRubySetup = null;
    gemset = import ./tests/multi_app/gemset.nix;
  });

  gems = import ./modules/gems requirements;
  gempaths = lib.attrValues gems;

in {
  # in `nix repl`
  # :te true
  # :l test.nix
  # :r
  inherit gems gempaths;
}

