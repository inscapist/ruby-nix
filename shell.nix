{ pkgs ? import <nixpkgs> { }
, bundix
}:
let
  rubyNix = (import ./default.nix bundix) pkgs;
  inherit (rubyNix {
    name = "rubynix-test";
    gemset = ./tests/tiny_app/gemset.nix;
    gemPlatforms = [ "ruby" "arm64-darwin-20" "x86_64-linux" ];
  }) env envMinimal;
in
pkgs.mkShell {
  buildInputs = [ env ] ++
    (with pkgs; [ rnix-lsp nixfmt ]);
}
