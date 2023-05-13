inputs @ {...}: {
  config,
  pkgs,
  lib,
  ...
}: let
  cfg = config.billwinnett.windowing.hyprland;
in {
  options.billwinnett.windowing.hyprland = {
    enable = lib.mkEnableOption "enable hyprland";
  };

  config = lib.mkIf cfg.enable {
    programs.hyprland.enable = true;
    services.xserver.displayManager.sessionPackages = [inputs.hyprland.packages.${pkgs.system}.default];

    # Configure keymap in X11
    services.xserver = {
      layout = "us";
      xkbVariant = "";
    };
  };
}
