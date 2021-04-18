{ buildIdris, fetchFromGitHub }:

buildIdris {

  name = "sdl";

  src = fetchFromGitHub {
    owner = "ShinKage";
    repo = "idris2-sdl";
    rev = "f196d8485e5ee9f642ff879703349d4b9c986d2c";
    sha256 = "uJjGvZnmftkl4bwTXN9aOAXPEjsz/8QxHvyeA/gjDax=";
  };

}
