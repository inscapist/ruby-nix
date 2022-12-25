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

          inherit (rubyNix {
            name = "simple-ruby-app";
            gemset = ./gemset.nix;
          }) env envMinimal;

        in
        rec {
          devShells = rec {
            default = dev;
            dev = pkgs.mkShell {
              buildInputs = [ env ];
            };
          };
        });
}
