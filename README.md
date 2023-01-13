# Ruby Nix

This is technically a fork of `bundlerEnv` that attempts to better meet the needs of ruby app developers instead of package maintainers.

This flake exports a function `rubyNix` that is suitable for local development (eg. Rails).

## Features

1. supports local, path-based gems
2. supports pre-compiled native gems on multiple platforms (see [this discussion](https://github.com/nix-community/bundix/pull/68))
3. bundix and bundler out of the box
4. Two starter templates based on flakes

## How is it different from bundlerEnv?

1. it does not track the entire directory as `inputSrc` when `gemDir` is specified, requiring only the `gemset.nix`.
2. it does not use `BUNDLE_GEMFILE` variable.
3. it works without `Gemfile` and `Gemfile.lock`.
4. it does not override `GEM_HOME`.

## The gist

``` nix
      let
        pkgs = import nixpkgs {
          inherit system;
          overlays = [ ruby-nix.overlays.ruby ];
        };
        rubyNix = ruby-nix.lib pkgs;

        inherit (rubyNix {
          name = "simple-ruby-app";
          gemset = ./gemset.nix;
        })
          env ruby;
      in {
        devShells = rec {
          default = dev;
          dev = pkgs.mkShell { buildInputs = [ env ruby ]; };
        };
      });
```
## Global Bundix Installation (optional)

My bundix [fork](https://github.com/sagittaros/bundix) is needed to generate the correct `gemset.nix`. It is available in nix shell by default. 


``` sh
# installation
nix profile install github:sagittaros/bundix

# upgrade
nix profile upgrade '.*'
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

In a nix shell, you have `ruby`, `irb`, `bundle` at your disposal. Additional gems will only be available if they are specified in `gemset.nix`. To generate that, ensure `Gemfile` and `Gemfile.lock` are present, then run `bundix`. 

## FAQs

### 1. When does my environment gets build?
If you use direnv, running `git add gemset.nix` would trigger a rebuild automatically.

Otherwise, Ctrl-D to exit the current nix shell, and enter again.


### 2. How to `bundle`?

With ruby-nix, you shouldn't install gems using bundle. Nix will build the gems for you. **Always run `bundix` to update your gemset after making changes to Gemfile.lock.**

#### bundle add
run `bundle add GEM --skip-install` instead

#### bundle install (after modifying Gemfile)
run `bundle lock` instead

#### Adding multiple platforms to Gemfile.lock

One example could be:

``` sh
bundle lock --update --add-platform ruby arm64-darwin-21 x86_64-darwin-20 x86_64-linux
```

You can retrieve the platform names by running `bundle platform`. Having multiple platforms would allow your colleagues to use precompiled gems, if they are available.

### 3. How to use a different ruby version

[simple-app](examples/simple-app/flake.nix) shows how to use ruby_3_1 insted of the
default version (2.7.6).

## Credits

All credits goes to the original authors of `buildRubyGem`, `bundlerEnv`, and `bundix` (@manveru, @lavoiesl, @jdelStrother). This is only a thin layer with a different take on top of these solid foundation. 

PRs welcomed :)
