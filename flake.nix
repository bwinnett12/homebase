{
  description = "nixos configuration";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nurpkgs.url = "github:nix-community/NUR";

    eww = {
      url = "github:justinrubek/eww";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    flake-utils.url = "github:numtide/flake-utils";
    flake-parts.url = "github:hercules-ci/flake-parts";
    pre-commit-hooks.url = "github:cachix/pre-commit-hooks.nix";

    nixvim = {
      url = "github:pta2002/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
    neovim-nightly-overlay.inputs.nixpkgs.follows = "nixpkgs";

    hyprland.url = "github:hyprwm/hyprland";
  };

  outputs = {
    self,
    flake-parts,
    ...
  } @ inputs:
    flake-parts.lib.mkFlake {inherit inputs;} {
      flake = {
        homeModules = import ./home/modules inputs;
      };
      systems = ["x86_64-linux" "aarch64-linux"];
      imports = [
        ./flake-parts/devshell

        ./lib

        ./modules

        ./flake-parts/nixos_configurations.nix
        ./nixos/configurations
        ./nixos/modules

        ./flake-parts/home_configurations.nix
        ./home/configurations
      ];
    };
}
