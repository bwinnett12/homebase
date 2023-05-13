inputs @ {self, ...}: {
  config,
  pkgs,
  lib,
  ...
}: let
  cfg = config.billwinnett.graphical.fonts;
in {
  options.billwinnett.graphical.fonts = {
    enable = lib.mkEnableOption "enable fonts";
  };

  config = lib.mkIf cfg.enable {
    fonts = {
      fonts = [
        pkgs.lexend
        pkgs.nerdfonts
        pkgs.noto-fonts
        pkgs.noto-fonts-emoji

        pkgs.roboto
      ];

      fontconfig.defaultFonts = {
        serif = ["Noto Serif" "Noto Color Emoji"];
        sansSerif = ["Noto Sans" "Noto Color Emoji"];
        monospace = ["JetBrainsMono Nerd Font" "Noto Color Emoji"];
        emoji = ["Noto Color Emoji"];
      };
    };
  };
}
