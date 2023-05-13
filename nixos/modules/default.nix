{
  inputs,
  self,
  ...
} @ moduleInput: let
  # TODO: Rewrite modules to have better inputs
in {
  flake.nixosModules = {
    cachix = import ./cachix inputs;
    nix = import ./nix.nix inputs;
    flake = import ./flake.nix inputs;
    sound = import ./sound.nix inputs;

    "graphical/fonts" = import ./graphical/fonts moduleInput;

    "windowing/hyprland" = import ./windowing/hyprland inputs;
    "windowing/plasma" = import ./windowing/plasma inputs;

    admin_ssh = import ./admin_ssh.nix inputs;
  };
}
