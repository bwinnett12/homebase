_: {
  config,
  lib,
  pkgs,
  ...
} @ inputs: let
  cfg = config.billwinnett.windowing.xmonad;
in {
  options.billwinnett.windowing.xmonad = {
    enable = lib.mkEnableOption "Enable xmonad";
  };

  config = lib.mkIf cfg.enable {
    xsession.windowManager.xmonad.enable = true;
    xsession.windowManager.xmonad.enableContribAndExtras = true;

    home.file.".xmonad/xmonad.hs".source = ./xmonad.hs;
  };
}
