{
  boot.loader.systemd-boot.enable = false;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot/efi";
  boot.loader.grub = {
    devices = ["nodev"];
    efiSupport = true;
    enable = true;
    useOSProber = true;
  };

  boot.initrd.availableKernelModules = ["nvme" "ahci" "thunderbolt" "xhci_pci" "usb_storage" "usbhid" "sd_mod"];
  boot.initrd.kernelModules = [];
  boot.kernelModules = [];
  boot.extraModulePackages = [];
}
