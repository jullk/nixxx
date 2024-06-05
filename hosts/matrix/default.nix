{pkgs, ...}: {
  system.stateVersion = "24.05";

  networking.hostName = "matrix";

  time.timeZone = "Asia/Shanghai";

  hardware.opengl.enable = true;
  hardware.opengl.extraPackages = [pkgs.mesa.drivers];

  wsl = {
    enable = true;
    nativeSystemd = true;
    startMenuLaunchers = false;
    wslConf = {
      interop.appendWindowsPath = false;
    };
  };

  environment.systemPackages = with pkgs; [
    wslu
  ];
}
