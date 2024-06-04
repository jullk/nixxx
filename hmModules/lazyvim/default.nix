{
  lib,
  pkgs,
  config,
  ...
}:
with lib; let
  cfg = config.hmModules.lazyvim;
  configDir = ../../config;
in {
  options = {
    hmModules.lazyvim = {
      enable = mkEnableOption "Lazyvim";
    };
  };

  config = mkIf cfg.enable {
    programs.neovim = let
      neovimPrivateDir = "${configDir}/lazyvim";
    in {
      enable = true;
      vimAlias = true;
      extraConfig =
        ''
          lua << EOF
          vim.opt.runtimepath:append('${neovimPrivateDir}')
        ''
        + builtins.readFile "${neovimPrivateDir}/init.lua"
        + "EOF";
    };
  };
}
