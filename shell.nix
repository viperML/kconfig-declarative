with import <nixpkgs> { };
((callPackage ./. { }).override {
  stdenv = clangStdenv;
}).overrideAttrs
  (old: {
    src = null;
    hardeningDisable = [ "all" ];
    nativeBuildInputs = old.nativeBuildInputs ++ [
      clang-tools
      lldb
    ];
  })
