{ pkgs, lib, fetchFromGitHub, stdenv, idris2 }:
let
  withPackages = pkgs.callPackage ./with-packages.nix { inherit idris2; };
  buildIdris = { name, src, idrisLibraries ? [ ], extraBuildInputs ? [ ] }:
    pkgs.callPackage ./buildIdris.nix
      { inherit src name withPackages extraBuildInputs idrisLibraries idris2; };
  mythingy = file: args: pkgs.callPackage file (lib.recursiveUpdate { inherit buildIdris; } args);

in
rec {
  packages = rec {
    comonad = pkgs.callPackage ./comonad.nix { inherit buildIdris; };
    elab-util = pkgs.callPackage ./elab-util.nix { inherit buildIdris; };
    readline = pkgs.callPackage ./readline.nix { inherit buildIdris; };
    with-ffi = pkgs.callPackage ./with-ffi.nix { inherit buildIdris; };
    comonado = mythingy ./comonad.nix { };
  };

  withPkgs = fn: withPackages (fn packages);
}
