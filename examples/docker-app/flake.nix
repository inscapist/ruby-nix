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
          pkgs = import nixpkgs {
            inherit system;
            overlays = [ ruby-nix.overlays.ruby ];
          };
          rubyNix = ruby-nix.lib pkgs;

          inherit (rubyNix {
            name = "simple-ruby-app";
            gemset = ./gemset.nix;
            gemPlatforms = [ "ruby" "arm64-darwin-20" "x86_64-linux" ];
          }) env envMinimal;

          # https://github.com/NixOS/nixpkgs/blob/master/pkgs/build-support/docker/examples.nix
          dockerImage = pkgs.dockerTools.buildImage {
            name = "ruby-app-image";
            tag = "latest";
            copyToRoot = pkgs.buildEnv {
              name = "ruby-docker-env";
              paths = [ ./. env ] ++ (with pkgs; [ which bash coreutils ]);
              pathsToLink = [ "/" ];
            };
            config = {
              Cmd = [ "/bin/rails" "server" "-b" "0.0.0.0" ];
            };
          };
        in
        {
          packages.default = dockerImage;
          devShells = rec {
            default = dev;
            dev = pkgs.mkShell {
              buildInputs = [ env ];
            };
          };
        });
}
