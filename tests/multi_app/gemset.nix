{
  sorbet-static = {
    groups = [ "default" ];
    nativeSources = [
      {
        platform = "universal-darwin-21";
        remotes = [ "https://rubygems.org" ];
        sha256 = "10ydy3q12yswmjjinixixjqp737knbr7gwnbn9g8dfy5jmjkjjy3";
        type = "gem";
      }
      {
        platform = "x86_64-linux";
        remotes = [ "https://rubygems.org" ];
        sha256 = "0cs0qwp89w249yklqb41l88s86hsskf96km16wn93441w3vpv015";
        type = "gem";
      }
      {

        platform = "universal-darwin-20";
        remotes = [ "https://rubygems.org" ];
        sha256 = "0dgalb4f6h6fpq1ch67c3hbngiha6i8ig5zs30y94pzipqmby1mp";
        type = "gem";
      }
    ];
    platforms = [ ];
    source = { };
    version = "0.5.10621";
  };
}
