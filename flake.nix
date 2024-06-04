{
  description = "Nix again";

  nixConfig = {
    experimental-features = ["nix-command" "flakes"];
    substituters = [
      # replace official cache with a mirror located in China
      "https://mirrors.bfsu.edu.cn/nix-channels/store"
      "https://cache.nixos.org/"
    ];

    # nix community's cache server
    extra-substituters = [
      "https://nix-community.cachix.org"
    ];
    extra-trusted-public-keys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    ];
  };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    flake-parts.url = "github:hercules-ci/flake-parts";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    nixos-wsl.url = "github:nix-community/NixOS-WSL";
    nixos-wsl.inputs.nixpkgs.follows = "nixpkgs";

    nix-inspect.url = "github:bluskript/nix-inspect";
  };

  outputs = inputs @ {flake-parts, ...}:
    flake-parts.lib.mkFlake {inherit inputs;} {
      imports = [
        ./nixosModules
        ./hosts
      ];
      systems = ["x86_64-linux"];

      flake = {
        # Any flake outputs
      };

      # Access attributes of the same system in self' and inputs'
      # pkgs is equivalent to inputs'.nixpkgs.legacyPackages
      perSystem = {
        config,
        self',
        inputs',
        pkgs,
        ...
      }: {
        devShells.default = pkgs.mkShell {
          name = "nix-utils";
          packages = [
            inputs'.nix-inspect.packages.default
            pkgs.alejandra
            pkgs.treefmt
          ];
        };
      };
    };
}
