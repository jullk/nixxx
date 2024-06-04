{
  nix = {
    settings = {
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

      # Prevent impurities in builds
      sandbox = true;

      # Give root user and wheel group special Nix privileges.
      trusted-users = ["root" "@wheel"];
      allowed-users = ["@wheel"];

      auto-optimise-store = true;
    };

    optimise.automatic = true;
    gc.automatic = true;

    extraOptions = ''
      min-free = 536870912
      keep-outputs = true
      keep-derivations = true
      fallback = true
    '';
  };
  services.earlyoom.enable = true;
}
