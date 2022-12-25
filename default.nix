{ stdenv
, lib
, buildEnv
, ruby
, bundler
, makeBinaryWrapper
, defaultGemConfig
, buildRubyGem
, ...
}@tools:

# this is where we specify how the ruby environment should be built
{ name ? "ruby-nix" # passed along to buildEnv
, gemset # path to gemset.nix or its content
, ruby ? tools.ruby # allow ruby to be overriden
, gemConfig ? defaultGemConfig # specific build instructions for native gems
, groups ? null # null or a list of groups, used by Bundler.setup
, document ? [ ] # e.g. [ "ri" "rdoc" ]
, extraSetup ? null # additional setup script goes here
}:

let
  requirements = (tools // {
    inherit name ruby bundler gempaths
      gemConfig groups document extraSetup;
    gemset =
      if builtins.typeOf gemset != "set"
      then import gemset else gemset;
  });

  gems = import ./modules/gems requirements;
  gempaths = lib.attrValues gems;
in
rec {
  inherit gems;
  rubyEnv = import ./modules/ruby-env requirements;
  ruby = rubyEnv.ruby;
}
