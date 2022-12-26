{ stdenv
, lib
, my
, mybundix
, ruby
, bundler
, buildEnv
, name
, gemPlatforms
, ...
}@args:

let
  rubyEnv = import ./ruby-env.nix args;

  extras = [
    bundler
    mybundix
    (my.shell "generate-gemset" ./generate-gemset.sh
      { platforms = builtins.concatStringsSep " " gemPlatforms; })
  ];

  # useful for development
  env = buildEnv {
    inherit name;
    paths = [ rubyEnv (lib.lowPrio rubyEnv.ruby) ] ++ extras;
    pathsToLink = [ "/" ];
    meta = {
      platforms = ruby.meta.platforms;
    };
  };

  # useful for production
  envMinimal = rubyEnv.override {
    inherit name;
  };
in
{ inherit env envMinimal; }
