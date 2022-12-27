{ stdenv, lib, fetchurl }:

stdenv.mkDerivation rec {
  pname = "rubygems";
  version = "3.3.26";

  src = fetchurl {
    url = "https://rubygems.org/rubygems/rubygems-${version}.tgz";
    # recompute with:
    #   nix hash to-base16 sha-{got ...}
    sha256 = "9b17a53a000a599926cf1ef19e9d2a35f87b436ae6500225eebe55db320dc68c";
  };

  patches = [
    ./0001-add-post-extract-hook.patch
    ./0002-binaries-with-env-shebang.patch
    ./0003-gem-install-default-to-user.patch
  ];

  installPhase = ''
    runHook preInstall
    cp -r . $out
    runHook postInstall
  '';

  meta = with lib; {
    description = "Package management framework for Ruby";
    homepage = "https://rubygems.org/";
    license = with licenses; [
      mit # or
      ruby
    ];
    maintainers = with maintainers; [ zimbatm ];
  };
}
