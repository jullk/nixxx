{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.hmModules.shell.nb;
in {
  options = {
    hmModules.shell.nb = {
      enable = mkEnableOption "Nb";
    };
  };
  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      nb
      w3m
      socat
      tig
      glow
      readability-cli
    ];
    programs = {
      bat = {
        enable = true;
      };
      ripgrep = {
        enable = true;
      };
      pandoc = {
        enable = true;
      };
    };
  };
}
