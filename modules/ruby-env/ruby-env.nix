{ stdenv
, lib
, makeBinaryWrapper
, buildEnv
, name
, ruby
, bundler
, gempaths
, groups
, extraRubySetup
, ...
}:

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

  # ruby binaries can the omitted in production
  wrappedRuby = stdenv.mkDerivation {
    name = "${name}-ruby";
    nativeBuildInputs = [ makeBinaryWrapper ];
    dontUnpack = true;

    buildPhase = ''
      mkdir -p $out/bin
      for i in ${ruby}/bin/*; do
        makeWrapper "$i" $out/bin/$(basename "$i") \
          --set GEM_HOME ${rubyEnv}/${ruby.gemPath} \
          --set GEM_PATH ${rubyEnv}/${ruby.gemPath}
      done
    '';

    dontInstall = true;
    doCheck = true;
    checkPhase = ''
      $out/bin/ruby --help > /dev/null
      $out/bin/gem --version > /dev/null
    '';
    inherit (ruby) meta;
  };

  rubyEnv = buildEnv {
    name = "${name}-ruby-env";
    paths = gempaths ++ [ bundler ];
    pathsToLink = [ "/lib" ];
    postBuild = mkBinStubs
      + lib.optionalString (extraRubySetup != null) extraRubySetup;
    passthru = {
      ruby = wrappedRuby;
    };
    meta = {
      platforms = ruby.meta.platforms;
    };
  };
in
rubyEnv
