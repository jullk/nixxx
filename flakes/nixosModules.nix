{self, lib, ...}:
{
  flake = {
    nixosModules = {
      nix-settings = import ../nixosModules/nix-settings.nix;
    };
  };
}
