if [ -f ./Gemfile ]; then
    echo "Removing current generated files"
    [ -e ./gemset.nix ] && rm ./gemset.nix

    bundle lock --add-platform @platforms@
    bundix
    echo "Generated gemset.nix"
else
    echo "Gemfile not found"
fi
