with import <nixpkgs> {};
let
    insync = callPackage ./default.nix {};
in
    mkShell {
        buildInputs = [insync cron];
    }
