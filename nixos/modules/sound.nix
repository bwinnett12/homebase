{unixpkgs, ...}: {
  config,
  pkgs,
  lib,
  ...
}: let
  cfg = config.billwinnett.sound;
in {
  options.billwinnett.sound = {
    enable = lib.mkEnableOption "enable sound";
  };

  config = lib.mkIf cfg.enable {
    sound.enable = true;

    services.pipewire = {
      enable = true;

      alsa.enable = true;
      alsa.support32Bit = true;

      pulse.enable = true;
      jack.enable = true;

      # use the example session manager (no others are packaged yet so this is enabled by default,
      # no need to redefine it in your config for now)
      #media-session.enable = true;
    };

    hardware.pulseaudio.enable = false;
    security.rtkit.enable = lib.mkDefault true;
  };
}