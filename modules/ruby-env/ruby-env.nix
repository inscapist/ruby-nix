{ stdenv, lib, makeBinaryWrapper, buildEnv, name, ruby, bundler, gempaths
, groups, extraRubySetup, ... }:

let
  # we could use substituteAll, but somehow this feels nicer
  mkBinStubs = ''
    ${ruby}/bin/ruby ${./gen-bin-stubs.rb} \
      "${ruby}/bin/ruby" \
      "$out/${ruby.gemPath}" \
      "${bundler}/${ruby.gemPath}/gems/bundler-${bundler.version}" \
      ${lib.escapeShellArg gempaths} \
      ${lib.escapeShellArg groups}
  '';

  rubyEnv = buildEnv {
    name = "${name}-ruby-env";
    paths = gempaths ++ [ bundler ];
    pathsToLink = [ "/lib" ];
    postBuild = mkBinStubs
      + lib.optionalString (extraRubySetup != null) extraRubySetup;
    passthru = {
      ruby = stdenv.mkDerivation {
        name = "${name}-ruby";
        nativeBuildInputs = [ makeBinaryWrapper ];
        dontUnpack = true;

        # setting this makes life somewhat more difficult for developers
        # set GEM_HOME ${rubyEnv}/${ruby.gemPath}
        buildPhase = ''
          mkdir -p $out/bin
          for i in ${ruby}/bin/*; do
            makeWrapper "$i" $out/bin/$(basename "$i") \
              --set GEM_PATH ${rubyEnv}/${ruby.gemPath}
          done
        '';

        dontInstall = true;
        doCheck = true;
        checkPhase = ''
          $out/bin/ruby --help > /dev/null
          $out/bin/gem --version > /dev/null
        '';
        meta = ruby.meta;
      };
    };
    meta = { platforms = ruby.meta.platforms; };
  };
in rubyEnv
