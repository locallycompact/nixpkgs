{ stdenv
, lib
, name
, src
, idris2
, idrisLibraries
, symlinkJoin
, makeWrapper
, withPackages
, ipkgName ? name + ".ipkg"
}:
let
  build = stdenv.mkDerivation {

    inherit name src;

    buildInputs = [ (withPackages idrisLibraries) ];

    buildPhase = ''
      idris2 --build ${ipkgName}
    '';

    installPhase = ''
      mkdir -p $out/bin
      mv build/exec/* $out/bin
    '';
  };

  installLibrary =
    let
      thisLib = build.overrideAttrs (oldAttrs: {
        buildPhase = "";

        installPhase = ''
          mkdir -p $out/${idris2.name}
          export IDRIS2_PREFIX=$out/
          idris2 --install ${ipkgName}
        '';

      });
    in
    symlinkJoin {
      inherit name;
      paths = [ thisLib ] ++ map (p: p.asLib) idrisLibraries;
    };

in
build // { asLib = installLibrary; }
