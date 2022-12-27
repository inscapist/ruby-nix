bundix:

{ stdenv
, lib
, buildEnv
, ruby
, makeBinaryWrapper
, defaultGemConfig
, buildRubyGem
, ...
}@pkgs:

# this is where we specify how the ruby environment should be built
{ name ? "ruby-nix" # passed along to buildEnv
, gemset ? { } # path to gemset.nix or its content
, gemPlatforms ? [ "ruby" ] # eg. x86_64-linux, arm64-darwin-20
, ruby ? pkgs.ruby # allow ruby to be overriden
, gemConfig ? defaultGemConfig # specific build instructions for native gems
, groups ? null # null or a list of groups, used by Bundler.setup
, document ? [ ] # e.g. [ "ri" "rdoc" ]
, extraRubySetup ? null # additional setup script goes here
}:

let
  my = import ./mylib.nix pkgs;
  mybundix = import bundix { inherit pkgs ruby bundler; };

  useGemBundler = builtins.hasAttr "bundler" gems;

  bundler =
    if useGemBundler then gems.bundler
    else pkgs.bundler.override (attrs: { inherit ruby; });

  requirements = (pkgs // {
    inherit my name ruby bundler mybundix gempaths useGemBundler
      gemConfig gemPlatforms groups document extraRubySetup;
    gemset =
      if builtins.typeOf gemset == "set"
      then gemset
      else
        (if builtins.pathExists gemset then
          import gemset else { });
  });

  gems = import ./modules/gems requirements;
  gempaths = lib.attrValues gems;
in
rec {
  inherit gems;
  inherit (import ./modules/ruby-env requirements) env envMinimal;
  ruby = env.ruby;
}
