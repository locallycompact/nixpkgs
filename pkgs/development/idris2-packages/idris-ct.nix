{ buildIdris, fetchFromGitHub }:

buildIdris {

  name = "idris-ct";

  src = fetchFromGitHub {
    owner = "statebox";
    repo = "idris-ct";
    rev = "fbc7f633e0d86bfe5b56a2c4b9db6f780d59106d";
    sha256 = "sha256-KWCVmmcq/WGGFToVu9azP/ah+SUxolvbML/D5qlMo7w=";
  } + "/idris2";

}
