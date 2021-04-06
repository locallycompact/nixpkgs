{ pkgs, lib, fetchFromGitHub, stdenv, idris2 }:
let
  withPackages = pkgs.callPackage ./with-packages.nix { inherit idris2; };
  buildIdris = { name, src, idrisLibraries ? [ ] }:
    pkgs.callPackage ./buildIdris.nix
      { inherit src name withPackages idrisLibraries idris2; };

in
rec {
  packages = rec {
    comonad = pkgs.callPackage ./comonad.nix { inherit buildIdris; };
    elab-util = pkgs.callPackage ./elab-util.nix { inherit buildIdris; };
  };

  withPkgs = fn: withPackages (fn packages);
}
