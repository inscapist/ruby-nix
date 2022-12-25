{
  description = "A simple ruby app demo";
  inputs = {
    nixpkgs.url = "nixpkgs";
    ruby-nix.url = "github:sagittaros/ruby-nix";
    devshell.url = "github:numtide/devshell";
    flake-utils.url = "github:numtide/flake-utils";
  };
  outputs = { self, nixpkgs, ruby-nix, devshell, flake-utils }:
    flake-utils.lib.eachSystem [
      "aarch64-darwin"
      "x86_64-darwin"
      "x86_64-linux"
    ]
      (system:
        let
          pkgs = import nixpkgs {
            inherit system;
            overlays = [ devshell.overlay ];
          };
          rubyNix = import ruby-nix pkgs;

          inherit (rubyNix {
            name = "simple-ruby-app";
            gemset = ./gemset.nix;
          }) env envMinimal;
        in
        {
          devShells = rec {
            default = dev;
            dev = with pkgs.devshell;
              mkShell {
                imports = [ (importTOML ./devshell.toml) ];
              };
          };
        });
}
