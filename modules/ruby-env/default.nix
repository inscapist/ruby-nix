{ stdenv
, lib
, my
, mybundix
, ruby
, buildEnv
, name
, gemPlatforms
, ...
}@args:

let
  rubyEnv = import ./ruby-env.nix args;

  extras = [
    mybundix
    (my.shell "relock-gems" ./relock-gems.sh
      {
        platforms = builtins.concatStringsSep " " gemPlatforms;
      })
    (my.shell "generate-gemset" ./generate-gemset.sh { })
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
