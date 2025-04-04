{
  stdenv,
  lib,
  buildEnv,
  ruby,
  makeBinaryWrapper,
  defaultGemConfig,
  buildRubyGem,
  ...
}@pkgs:

# this is where we specify how the ruby environment should be built
{
  name ? "ruby-nix", # passed along to buildEnv
  gemset ? { }, # path to gemset.nix or its content
  ruby ? pkgs.ruby, # allow ruby to be overriden
  gemConfig ? defaultGemConfig, # specific build instructions for native gems
  groups ? null, # null or a list of groups, used by Bundler.setup
  document ? [ ], # e.g. [ "ri" "rdoc" ]
  extraRubySetup ? null, # additional setup script goes here
  ignoreCollisions ? true, # whether to ignore collisions or abort
}:

let
  my = import ./mylib.nix pkgs;

  requirements = (
    pkgs
    // {
      inherit
        my
        name
        ruby
        gempaths
        gemConfig
        groups
        document
        extraRubySetup
        ignoreCollisions
        ;
      gemset =
        if builtins.typeOf gemset == "set" then
          gemset
        else
          (if builtins.pathExists gemset then import gemset else { });
    }
  );

  inherit (import ./modules/gems requirements) gempaths;
  inherit (import ./modules/ruby-env requirements) env envMinimal;
in
rec {
  version = "v0.1.2";
  ruby = env.ruby;
  inherit env envMinimal;
}
