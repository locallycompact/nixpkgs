{ buildIdris, fetchFromGitHub, SDL2, SDL2_image }:

buildIdris {

  name = "sdl";

  extraBuildInputs = [SDL2 SDL2_image];

  src = fetchFromGitHub {
    owner = "ShinKage";
    repo = "idris2-sdl";
    rev = "f196d8485e5ee9f642ff879703349d4b9c986d2c";
    sha256 = "sha256-lc8IEjay3CahzhHvVX3SnQF2KZy9WO7o1KASN9cYNPQ=";
  };

}
