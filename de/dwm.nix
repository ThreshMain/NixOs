
{ config, pkgs, ... }:

{
  imports = [ 
    ../nvidia-sync.nix
    ./default.nix
   ];
  services.xserver = {
    displayManager = {
        sddm.enable = true;
        defaultSession = "none+customdwm";
    };

    windowManager = {
      session = [{ 
        name = "customdwm";
        start =
          ''
          /home/martin/.dwm/autostart &
          waitPID=$!
          '';
      }]; 
      dwm.enable = true;
    };
  };

  nixpkgs.overlays = [
    (final: prev: {
      dwm = prev.dwm.overrideAttrs (old: { 
        src = pkgs.fetchFromGitHub {
          owner = "ThreshMain";
          repo = "dwm-flexipatch";
          rev = "master";
          sha256 = "sha256-PlfLEiif6a0FMZNLkPtE1l/uZWxViiVIY96vhtDJ4a0=";
        };
        buildInputs = old.buildInputs ++ [ pkgs.imlib2 ];
      });
    })
  ];
  
  environment = {
    systemPackages = with pkgs; [
      rofi
      acpi
      slock # locker
      xmenu
      # no longer needed thanks to dwm patchwmname # fix problems with JDK 
      pasystray
      xorg.xbacklight
      dconf
    ];
    sessionVariables.PATH = [ "/home/martin/.dwm" ];
  };

  services.dwm-status = {
    enable  = true;
    order = [ "cpu_load" "audio" "battery" "time" ];
    extraConfig = ''
      separator = "    "
      [audio]
      mute = "ﱝ"
      template = "{ICO} {VOL}%"
      icons = ["奄", "奔", "墳"]

      [battery]
      charging = ""
      discharging = ""
      no_battery = ""
      icons = ["", "", "", "", "", "", "", "", "", "", ""]

      [time]
      format = "%Y-%d-%m %H:%M"
      '';
  };
  services.gvfs.enable = true;
  services.gnome.gnome-keyring.enable = true;
  services.autorandr.enable = true;
}
