# Ruby Nix

This is technically a fork of `bundlerEnv`. However, unlike `bundlerEnv`, it attempts to meet the needs of ruby app developers instead of package maintainers.

This flake exports a function `rubyNix` that is suitable for local development (eg. Rails) with local Gemfile and local gems.

## Usage

With nix [installed](/docs/nix-installation.md) and optionally [direnv](/docs/direnv.md), you can run:

#### 1. Initialize flake

``` sh
cd myapp
nix flake init -t github:sagittaros/ruby-nix
```

#### 2. Enter nix shell

If you are a [direnv](/docs/direnv.md) user, simply run `direnv allow`. Otherwise, run `nix develop -c zsh`.

#### 3. In nix shell

Run `update-gems` to generate gemset. Binstubs will already be accessible, running `rspec` will be equivalent to running `bundle exec rspec`, for example.

## Credits

All credits goes to the original authors of `buildRubyGem`, `builderEnv`, and `bundix`. This is only a thin layer with a different take on top of these solid foundation.

PRs welcomed :)
