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
      rust = mkShell {
        name = "rust-dev";
        packages = let
          nightly-rust = pkgs.rust-bin.selectLatestNightlyWith (toolchain:
            toolchain.default.override {
              extensions = ["rust-src" "rust-analyzer-preview"];
            });
        in [
          nightly-rust
          taplo
        ];
      };
      go = mkShell {
        name = "go-dev";
        packages = [
          go
          delve
          gopls
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
          hoogle
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
