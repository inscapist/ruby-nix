#!@shell@

echo "Removing current generated files"
[ -e ./Gemfile.lock ] && rm ./Gemfile.lock
[ -e ./gemset.nix ] && rm ./gemset.nix

# See: https://github.com/NixOS/nixpkgs/blob/master/doc/languages-frameworks/ruby.section.md#platform-specific-gems
bundle config set --local force_ruby_platform true

echo "Creating a Gemfile.lock by running @bundler@"
@bundler@ lock

echo "Create a gemset.nix by running @bundix@"
@bundix@ --lock

echo "Updated gemset.nix"
