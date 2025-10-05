{
  stdenv,
  nix-gitignore,
  cmake,
  qt6,
  kdePackages,
  nlohmann_json,
  cli11,
}:
stdenv.mkDerivation {
  name = "kconfig-declarative";
  src = nix-gitignore.gitignoreSource [ ] ./.;
  nativeBuildInputs = [
    cmake
    qt6.wrapQtAppsNoGuiHook
  ];
  buildInputs = [
    qt6.qtbase
    kdePackages.kconfig
    nlohmann_json
    cli11
  ];
  meta.mainProgram = "kconfig-declarative";
}
