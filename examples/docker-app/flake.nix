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
    ] (system:
      let
        pkgs = import nixpkgs {
          inherit system;
          overlays = [ ruby-nix.overlays.ruby ];
        };
        rubyNix = ruby-nix.lib pkgs;

        inherit (rubyNix {
          name = "simple-ruby-app";
          gemset = ./gemset.nix;
        })
          env;

        # XXX this is currently unmaintained. Use this as reference only!

        # https://github.com/NixOS/nixpkgs/blob/master/pkgs/build-support/docker/examples.nix
        dockerImage = pkgs.dockerTools.buildImage {
          name = "ruby-app-image";
          tag = "latest";
          # /// Uncomment below to use alpine image that provides more utilities such as `ps`, `hostname`, ...
          # /// This can be generated with `nix-prefetch-docker`
          #
          # fromImage = pkgs.dockerTools.pullImage {
          #   imageName = "alpine";
          #   imageDigest = "sha256:8914eb54f968791faf6a8638949e480fef81e697984fba772b3976835194c6d4";
          #   sha256 = "0mn4hr0cpwa8g45djnivmky3drdvsb38r65hlbx9l88i5p8qhld6";
          #   finalImageName = "alpine";
          #   finalImageTag = "latest";
          # };
          #
          copyToRoot = pkgs.buildEnv {
            name = "ruby-docker-env";
            paths = with pkgs.lib;
              [ (cleanSource ./.) env ]
              ++ (with pkgs; [ which bash coreutils ]);
            pathsToLink = [ "/" ];
          };
          config = { Cmd = [ "/bin/rails" "server" "-b" "0.0.0.0" ]; };
        };
      in {
        packages.default = dockerImage;
        devShells = rec {
          default = dev;
          dev = pkgs.mkShell { buildInputs = [ env ]; };
        };
      });
}
