final: prev: rec {
  rubygems = with final; import ./rubygems { inherit stdenv lib fetchurl; };

  ruby = prev.ruby.overrideAttrs (attrs: {
    postUnpack = ''
      rm -rf $sourceRoot/{lib,test}/rubygems*
      cp -r ${rubygems}/lib/rubygems* $sourceRoot/lib
      cp -r ${rubygems}/test/rubygems $sourceRoot/test
    '';
  });
}
