# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ 
      (modulesPath + "/installer/scan/not-detected.nix")
      <nixos-hardware/msi/gs60>
    ];
  boot.initrd.availableKernelModules = [ "xhci_pci" "nvme" "usbhid" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];

  # Air plane mode fix
  boot.kernelParams = [ "acpi_osi=!" ''acpi_osi="Windows 2006"'' ];

  # lid close action
  services.logind.lidSwitch = "ignore";
  services.logind.lidSwitchDocked = "ignore";
  services.logind.extraConfig = "HandleLidSwitch=ignore";

  fileSystems."/" =
    { device = "zroot/root";
      fsType = "zfs";
    };

  fileSystems."/nix" =
    { device = "zroot/root/nix";
      fsType = "zfs";
    };

  fileSystems."/home" =
    { device = "zroot/root/home";
      fsType = "zfs";
    };
  
  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/4661-989F";
      fsType = "vfat";
    };
  
  fileSystems."/mnt/windows" = 
    {
      device = "/dev/disk/by-uuid/E60284100283E441";
      fsType = "auto";
      options = [ "defaults" "user" "rw" "utf8" "noauto" "umask=000" ];
    };

  swapDevices = [{
      device = "/dev/nvme1n1p3";
  }];

  powerManagement.cpuFreqGovernor = lib.mkDefault "powersave";
}
