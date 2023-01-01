# Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{

  imports = [ # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ./packages/packages.nix
    ./grub-savedefault.nix
    ./users/default.nix
    ./de/dwm.nix
    ./services/services.nix
    ./yubikey/yubikey.nix
    ./plymouth.nix
  ];

  networking.hostName = "idk";
  networking.hostId = "69faa160";
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Prague";

  # Change default time limit for unit stop
  systemd.extraConfig = ''
    DefaultTimeoutStopSec=5s
  '';

  networking.useDHCP = false;

  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };

  system.stateVersion = "22.11"; # Did you read the comment?
}
