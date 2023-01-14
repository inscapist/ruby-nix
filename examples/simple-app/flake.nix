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

        # TODO generate with bundix, and use it below
        # gemset = import ./gemset.nix;
        gemset = { };

        # NOTE If you want to override gem build config
        # See: https://github.com/NixOS/nixpkgs/blob/master/pkgs/development/ruby-modules/gem-config/default.nix
        # gemConfig = {
        #   cbc-wrapper = _: { buildInputs = [ pkgs.cbc ]; };
        #   gpgme = _: { buildInputs = [ pkgs.pkg-config ]; };
        # };
        gemConfig = { };

      in rec {
        devmode = ruby-nix.presets.devmode;
        finalGemset = devmode // gemset;

        inherit (rubyNix {
          name = "talenox-rails";
          gemset = finalGemset;
          ruby = pkgs.ruby;
          gemConfig = pkgs.defaultGemConfig // gemConfig;
        })
          env ruby;

        devShells = rec {
          default = dev;
          dev = pkgs.mkShell {
            # NOTE ordering is important here, the head in $PATH always take precedence
            buildInputs = [ ruby env ]
              ++ (with pkgs; [ nodejs-19_x yarn rufo ]);
          };
        };
      });
}
