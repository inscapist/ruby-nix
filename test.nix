{
  pkgs ? import <nixpkgs> { },
}:

# in `nix repl`
# :te true
# :l test.nix
# :r
# :p gemsetVersions.sorbet-static

rec {
  inherit (pkgs) lib ruby defaultGemConfig;

  requirements = (
    pkgs
    // {
      inherit ruby gempaths;
      name = "test-ruby-nix";
      my = import ./mylib.nix pkgs;
      gemConfig = defaultGemConfig // {
        sorbet-static = _: { buildFlags = [ "--random-flag" ]; };
      };
      groups = null;
      document = [ ];
      extraRubySetup = null;
      gemset = import ./tests/multi_app/gemset.nix;
    }
  );

  inherit (import ./modules/gems requirements)
    gems
    gempaths
    gemsetVersions
    selected
    ;

  inherit (import ./modules/ruby-env requirements) env envMinimal;
}
