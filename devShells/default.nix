{self, ...}: {
  # Access attributes of the same system in self' and inputs'
  # pkgs is equivalent to inputs'.nixpkgs.legacyPackages
  perSystem = {
    config,
    self',
    inputs',
    pkgs,
    ...
  }: {
    devShells = with pkgs; {
      default = mkShell {
        name = "nix-utils";
        packages = [
          inputs'.nix-inspect.packages.default
          pkgs.alejandra
          pkgs.treefmt
        ];
      };
      haskell = mkShell {
        name = "haskell-dev";
        packages = [
          (ghc.withPackages (hp:
            with hp; [
              vector
              unordered-containers
              microlens-platform
              conduit
              foldl
              random
              wreq
              protolude
            ]))
          cabal-install
          cabal2nix
          haskell-language-server
          haskellPackages.cabal-fmt
          haskellPackages.eventlog2html
          haskellPackages.threadscope
        ];
      };
    };
  };
}
