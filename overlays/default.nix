{
  self,
  lib,
  inputs,
  ...
}: {
  imports = [
    inputs.flake-parts.flakeModules.easyOverlay
  ];
  perSystem = {
    config,
    self',
    inputs',
    pkgs,
    ...
  }: {
    overlayAttrs = {
      inherit
        (inputs'.latest.legacyPackages)
        # neovim-unwrapped
        ;
    };
  };
}
