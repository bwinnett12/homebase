input @ {
  self,
  inputs,
  config,
  ...
}: let
  # TODO: Rework structure of the flake's nixosConfigurations to not need this everywhere
  mkLegacyConfig = {
    name,
    modules ? [],
    system,
    ...
  }: {
    inherit system;

    modules = let
      configDir = "${self}/nixos/configurations/${name}";
      entryPoint = import configDir (inputs // {inherit self;});
      bootloader = "${configDir}/bootloader.nix";
      hardware = "${configDir}/hardware.nix";
    in
      [
        # import the expected modules
        entryPoint
        bootloader
        hardware
      ]
      ++ modules;
  };
in {
  billwinnett.nixosConfigurations = {
    lamer = mkLegacyConfig {
      system = "x86_64-linux";
      name = "lamer";
    };
  };
}
