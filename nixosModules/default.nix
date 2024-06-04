{
  self,
  lib,
  ...
}: {
  flake = {
    nixosModules = {
      nix-settings = import ./nix-settings.nix;
    };
  };
}
