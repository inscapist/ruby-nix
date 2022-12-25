{ stdenv
, lib
, makeBinaryWrapper
, buildEnv
, name
, ruby
, bundler
, gems
, groups
, extraSetup
, ...
}:

let
  # we could use substituteAll, but somehow this feels nicer
  mkBinStubs = ''
    ${ruby}/bin/ruby ${./gen-bin-stubs.rb} \
      "${ruby}/bin/ruby" \
      "$out/${ruby.gemPath}" \
      "${bundler}/${ruby.gemPath}/gems/bundler-${bundler.version}" \
      ${lib.escapeShellArg gems} \
      ${lib.escapeShellArg groups}
  '';
  envArgs = {
    inherit name;

    paths = gems;
    pathsToLink = [ "/lib" ]; # /bin is created in postBuild

    postBuild = mkBinStubs
      + lib.optionalString (extraSetup != null) extraSetup;

    passthru = {
      # This wraps ruby, gem and other tools from nixpkgs#ruby
      ruby = stdenv.mkDerivation {
        name = "wrapped-ruby-${name}";

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
    };

    meta = {
      platforms = ruby.meta.platforms;
    };
  };
  rubyEnv = buildEnv envArgs;
in
rubyEnv
