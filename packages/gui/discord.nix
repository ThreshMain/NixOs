{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    (master.discord.override {
      nss = nss_latest;
      withOpenASAR = true;
    })
    # discord-ptb
    # discord-canary
    webcord.webcord
    # betterdiscord-installer
  ];
}
