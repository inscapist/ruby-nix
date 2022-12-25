{
  description = "A simple ruby app demo";
  inputs = {
    nixpkgs.url = "nixpkgs";
    ruby-nix.url = "github:sagittaros/ruby-nix";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, ruby-nix, flake-utils }:
    flake-utils.lib.eachSystem [
      "aarch64-darwin"
      "x86_64-darwin"
      "x86_64-linux"
    ]
      (system:
        let
          pkgs = import nixpkgs { inherit system; };
          rubyNix = import ruby-nix pkgs;
          shell = cmd: path: pkgs.writeShellScriptBin cmd
            (builtins.readFile path);

          inherit (rubyNix {
            name = "simple-ruby-app";
            gemset = ./nix/gemset.nix;
          }) rubyEnv ruby;

          # run `update-gems` in nix shell
          updateGems = shell "update-gems" ./nix/update-gems.sh;
        in
        rec {
          devShells = rec {
            default = dev;
            # nix develop -c zsh
            dev = pkgs.mkShell {
              buildInputs = [ rubyEnv ruby updateGems pkgs.bundix ];

              # TODO remove this
              shellHook = ''
                echo To use your own Gemfile:
                echo  1. replace Gemfile and Gemfile.lock with your own
                echo  2. nix develop -c zsh
                echo  3. update-gems
              '';
            };
          };
        });
}
