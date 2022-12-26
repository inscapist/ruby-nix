if [ -f ./Gemfile ]; then
    echo "Removing current generated files"
    [ -e ./Gemfile.lock ] && rm ./Gemfile.lock
    [ -e ./gemset.nix ] && rm ./gemset.nix

    # See: https://github.com/NixOS/nixpkgs/blob/master/doc/languages-frameworks/ruby.section.md#platform-specific-gems
    # BUNDLE_FORCE_RUBY_PLATFORM=1 bundle lock

    bundix --lock
    echo "Generated gemset.nix"
else
    echo "Gemfile not found"
fi
