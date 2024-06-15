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
          alejandra
          treefmt
          nil
          manix
          lua-language-server
        ];
      };
    };
  };
}
