{ stdenv
, lib
, fetchFromGitHub
, libGL
, libGLU
, libpng
, libjpeg_turbo
, libuv
, libvorbis
, mbedtls
, openal
, pcre
, SDL2
, sqlite
}:

stdenv.mkDerivation rec {
  pname = "hashlink";
  version = "1.12";

  src = fetchFromGitHub {
    owner = "HaxeFoundation";
    repo = "hashlink";
    rev = version;
    sha256 = "AiUGhTxz4Pkrks4oE+SAuAQPMuC5T2B6jo3Jd3sNrkQ=";
  };

  patches = [ ./hashlink.patch ];

  buildInputs = [
    libGL
    libGLU
    libjpeg_turbo
    libpng
    libuv
    libvorbis
    mbedtls
    openal
    pcre
    SDL2
    sqlite
  ];

  makeFlags = [ "PREFIX=$(out)" ];

  meta = with lib; {
    description = "A virtual machine for Haxe";
    homepage = "https://hashlink.haxe.org/";
    license = licenses.mit;
    platforms = platforms.unix;
    maintainers = with maintainers; [ iblech locallycompact ];
  };
}
