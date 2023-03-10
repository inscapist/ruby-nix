{ stdenv, lib, my, bundix, buildEnv, name, ... }@args:

let
  rubyEnv = import ./ruby-env.nix args;

  extras = [ bundix ];

  # useful for development
  env = buildEnv {
    inherit name;
    paths = [ rubyEnv (lib.lowPrio rubyEnv.ruby) ] ++ extras;
    pathsToLink = [ "/" ];
    passthru = { ruby = rubyEnv.ruby; };
    meta = { platforms = rubyEnv.meta.platforms; };
  };

  # useful for production
  envMinimal = rubyEnv.override { inherit name; };
in { inherit env envMinimal; }
