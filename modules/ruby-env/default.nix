{ stdenv
, lib
, my
, ruby
, buildEnv
, name
, bundix
, ...
}@args:

let
  rubyEnv = import ./ruby-env.nix args;

  extras = [
    bundix
    (my.shell "generate-gemset" ./generate-gemset.sh)
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
  envMinimal = buildEnv {
    inherit name;
    paths = [ rubyEnv ];
    pathsToLink = [ "/lib" ];
    meta = {
      platforms = ruby.meta.platforms;
    };
  };
in
{ inherit env envMinimal; }
