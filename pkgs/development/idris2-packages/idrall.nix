{ buildIdris, fetchFromGitHub }:

buildIdris {

  name = "idrall";

  src = fetchFromGitHub {
    owner = "alexhumphreys";
    repo = "idrall";
    rev = "5854bb43eae3bbfc13ad0b9ef3d8eb505dbafb93";
    sha256 = "sha256-El7Oqk0FuDgues4RcaultOJTeEvFBE5DIfrR7EPLjUI=";
  };

}
