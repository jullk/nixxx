{
  self,
  lib,
  inputs,
  ...
}: let
  inherit
    (inputs)
    nixpkgs
    home-manager
    nixos-wsl
    my-nixvim
    ;
  system = "x86_64-linux";
  userName = "atriw";
  userEmail = "juxtaly@proton.me";
  ghName = "juxtaly";

  nixosUsers = {pkgs, ...}: {
    users.users.root.hashedPassword = "*";
    users.users.${userName} = {
      isNormalUser = true;
      extraGroups = [
        "wheel"
        "networkmanager"
        "audio"
        "video"
      ];
      shell = pkgs.zsh;
      password = "nixos"; # TODO: Deal with secrets later
    };
    environment.systemPackages = with pkgs; [
      nushell
      cached-nix-shell
    ];
    programs.zsh.enable = true;
  };
  hmUsers = {pkgs, ...}: {
    home-manager.users.${userName} = {
      imports = [
        ../hmModules
      ];
      home = {
        stateVersion = "22.11";
        sessionVariables = {
          EDITOR = "nvim";
          SHELL = "zsh";
        };
        packages = [
          my-nixvim.packages.${pkgs.system}.default
        ];
      };
      nixpkgs.overlays = [
        self.overlays.default
      ];
      xdg.enable = true;
      programs.git = {
        userName = "${userName}";
        userEmail = "${userEmail}";
      };
      programs.man.generateCaches = true;
      hmModules = {
        shell = {
          zsh.enable = true;
          # nushell.enable = true;
          tools.enable = true;
          # nb.enable = true;
        };
      };
    };
  };
  wslUsers = {
    wsl.defaultUser = "${userName}";
  };
  registry = {
    nix.registry = let
      mapMyRepo = fid: repo: {
        from = {
          id = fid;
          type = "indirect";
        };
        to = {
          owner = "${ghName}";
          inherit repo;
          type = "github";
        };
      };
    in {
      my-templates = mapMyRepo "t" "nix-templates";
      my-configs = mapMyRepo "x" "nixxx";
    };
  };
in {
  flake = {
    nixosConfigurations = {
      # WSL at home
      matrix = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          home-manager.nixosModules.default
          nixos-wsl.nixosModules.default
          self.nixosModules.nix-settings
          ./matrix
          nixosUsers
          hmUsers
          wslUsers
          registry
        ];
      };
    };
  };
}
