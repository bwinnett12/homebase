{...}: {pkgs, ...}: let
in {
  config = {
    activeProfiles = ["development" "browsing" "gaming" "graphical" "design" "work" "media"];

    programs.thunderbird = {
      enable = true;

      profiles = {
        "bill" = {
          isDefault = true;
        };
      };
    };

    billwinnett = {
      windowing.hyprland.enable = true;
      wayland = {
        common.enable = true;

        swaylock.enable = true;
      };

      programs.eww.enable = true;
    };

    home.packages = [
      pkgs.rofi
      (pkgs.dwarf-fortress-packages.dwarf-fortress-full.override {
        enableIntro = false;
      })

      pkgs.alejandra
      pkgs.prismlauncher
      pkgs.vscode
      pkgs.jetbrains.pycharm-professional
      pkgs.rstudio
    ];

    programs.zellij = {
      enable = true;
      settings = {
        default-shell = "zsh";
      };
    };

    # e.g. Specify a file in ~/.config/pgcli/config
    # xdg.configFile."pgcli/config".source = ./pgcli.config;
  };
}
