# Ruby Nix

This is technically a fork of `bundlerEnv` that attempts to better meet the needs of ruby app developers instead of package maintainers.

This flake exports a function `rubyNix` that is suitable for local development (eg. Rails).

## Features

1. supports local, path-based gems
2. supports platform-dependant pre-compiled gems (see [this discussion](https://github.com/nix-community/bundix/pull/68))
3. bundix and bundler out of the box
4. 2 flake templates, a basic app and a docker image example

## Usage gist

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

## Dev usage

With nix [installed](/docs/nix-installation.md) and optionally [direnv](/docs/direnv.md), you can run:

#### 1. Initialize flake

``` sh
cd myapp
nix flake init -t github:sagittaros/ruby-nix my-new-app
```

#### 2. Enter nix shell

If you are a [direnv](/docs/direnv.md) user, simply run `direnv allow`. Otherwise, run `nix develop -c zsh`.

#### 3. In nix shell

Replace `Gemfile` and run `generate-gemset`. ~~Currently, platform specific gems are [not yet supported](https://github.com/NixOS/nixpkgs/blob/master/doc/languages-frameworks/ruby.section.md#platform-specific-gems) and the platform is forced to be ruby.~~ It is supported now! 

## Building a Docker image

``` sh
nix flake init -t sagittaros/ruby-nix#docker-app
nix build
docker load < result
docker images
```

## Credits

All credits goes to the original authors of `buildRubyGem`, `bundlerEnv`, and `bundix` (@manveru, @lavoiesl, @jdelStrother). This is only a thin layer with a different take on top of these solid foundation. 

PRs welcomed :)
