{ pkgs, lib, fetchFromGitHub, stdenv, idris2 }:
let
  withPackages = pkgs.callPackage ./with-packages.nix { inherit idris2; };
  buildIdris = { name, src, idrisLibraries ? [ ] }:
    pkgs.callPackage ./buildIdris.nix
      { inherit src name withPackages idrisLibraries idris2; };

  idrisPackages = rec {
    comonad = buildIdris {
      name = "comonad";
      src = fetchFromGitHub {
        owner = "stefan-hoeck";
        repo = "idris2-comonad";
        rev = "9bc8ae122160231b6c387e86bae0a34f34f678eb";
        sha256 = "uJjGvZnmftkl4bwTXN9aOAXPEjsz/8QxHvyeA/gjDaw=";
      };
    };
  };

in
rec { 
  packages = rec {
    comonad = buildIdris {
      name = "comonad";
      src = fetchFromGitHub {
        owner = "stefan-hoeck";
        repo = "idris2-comonad";
        rev = "9bc8ae122160231b6c387e86bae0a34f34f678eb";
        sha256 = "uJjGvZnmftkl4bwTXN9aOAXPEjsz/8QxHvyeA/gjDaw=";
      };
    };
  };
  withPkgs = fn: withPackages (fn packages);
}
