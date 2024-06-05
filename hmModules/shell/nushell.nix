{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.hmModules.shell.nushell;
in {
  options = {
    hmModules.shell.nushell = {
      enable = mkEnableOption "Nushell";
    };
  };
  config = mkIf cfg.enable {
    programs.nushell = {
      enable = true;
      # Workaround
      # Nushell does not respect home.sessionVariables now.
      environmentVariables = builtins.mapAttrs (name: value: "\"${builtins.toString value}\"") config.home.sessionVariables;
    };
  };
}
