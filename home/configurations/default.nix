{inputs, ...}: let
  extraModules = [
    inputs.nixvim.homeManagerModules.nixvim
  ];
in {
  billwinnett.homeConfigurations = {
    "bill@lamer" = {
      system = "x86_64-linux";
      modules =
        extraModules
        ++ [
          {
            home.stateVersion = "22.11";
          }
        ];
    };
  };
}
