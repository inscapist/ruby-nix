# Ruby Nix

This is technically a fork of `bundlerEnv`. However, unlike `bundlerEnv`, it aims to solve a different problem. This flake exports a function `rubyNix` that is suitable for local development (eg. Rails) with local Gemfile and local gems.

## Usage

With nix [installed](/docs/nix-installation.md) and optionally [direnv](/docs/direnv.md), you can run:

``` sh
cd myapp
nix flake init -t github:sagittaros/ruby-nix
nix develop -c zsh
```

## Credits

All credits goes to the original authors of `buildRubyGem`, `builderEnv`, and `bundix`. This is only a thin layer with a different take on top of these solid foundation.
