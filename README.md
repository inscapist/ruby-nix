# Ruby Nix

This is technically a fork of `bundlerEnv` that attempts to better meet the needs of ruby app developers instead of package maintainers.

This flake exports a function `rubyNix` that is suitable for local development (eg. Rails).

## Features

1. supports local, path-based gems
2. supports pre-compiled native gems on multiple platforms (see [this discussion](https://github.com/nix-community/bundix/pull/68))
3. bundix and bundler out of the box
4. Two starter templates based on flakes

## The gist

``` nix
let
    pkgs = import nixpkgs { inherit system; };
    rubyNix = ruby-nix.lib pkgs;

    inherit (rubyNix {
        name = "simple-ruby-app";
        gemset = ./gemset.nix;
        # run `bundle platform` to find your platform
        gemPlatforms = [ "ruby" "arm64-darwin-20" "x86_64-linux" ];
    }) env envMinimal; 
in
{
    devShells = rec {
        default = dev;
        dev = pkgs.mkShell {
            buildInputs = [ env ];
        };
    };
}
```

## Usage

With nix [installed](/docs/nix-installation.md) and optionally [direnv](/docs/direnv.md), you can run:

#### 1. Initialize flake

``` sh
cd myapp
nix flake init -t github:sagittaros/ruby-nix
```

#### 2. Enter nix shell

If you are a [direnv](/docs/direnv.md) user, add the following content to `.envrc` and run `direnv allow`. Otherwise, run `nix develop -c zsh`.

```
if ! has nix_direnv_version || ! nix_direnv_version 2.2.0; then
  source_url "https://raw.githubusercontent.com/nix-community/nix-direnv/2.2.0/direnvrc" "sha256-5EwyKnkJNQeXrRkYbwwRBcXbibosCJqyIUuz9Xq+LRc="
fi
use flake
```

#### 3. In nix shell

Replace `Gemfile` and `Gemfile.lock` with your own and run `generate-gemset`. Otherwise, use `relock-gems` to generate both `Gemfile.lock` and `gemset.nix`.

## Building a Docker image

``` sh
nix flake init -t sagittaros/ruby-nix#docker-app
nix build
docker load < result
docker images
```

## Screencast (WIP)

``` sh
/tmp
▲ mkdir t1

/tmp
▲ cd t1

/tmp/t1
▲ nix flake init -t github:sagittaros/ruby-nix

wrote: /tmp/t1/gemset.nix
wrote: /tmp/t1/Gemfile
wrote: /tmp/t1/Gemfile.lock
wrote: /tmp/t1/flake.nix

/tmp/t1
▲ ls
flake.nix  Gemfile  Gemfile.lock  gemset.nix

/tmp/t1
▲ nix develop -c zsh
warning: creating lock file '/tmp/t1/flake.lock'
/tmp/t1
nix-shell ▲ irb
irb(main):001:0> require 'puma'
=> true
irb(main):002:0>

/tmp/t1 6s
nix-shell ▲ rails
Usage:
  rails new APP_PATH [options]
```


## Credits

All credits goes to the original authors of `buildRubyGem`, `bundlerEnv`, and `bundix` (@manveru, @lavoiesl, @jdelStrother). This is only a thin layer with a different take on top of these solid foundation. 

PRs welcomed :)
