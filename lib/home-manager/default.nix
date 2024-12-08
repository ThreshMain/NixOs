{
  self,
  inputs,
  ...
}: rec {
  mkHomeModules = {
    username,
    hostname,
    ...
  }: let
    standAlonePath = ../../home + "/${username}/${hostname}.nix";
    userSpecific = ../../home + "/${username}/default.nix";
    default = ../../home/default.nix;
    ifExists = file:
      if builtins.pathExists file
      then file
      else {};
  in
    [
      (ifExists standAlonePath)
      (ifExists userSpecific)
      default
      ({pkgs, ...}: rec {
        home.stateVersion = "22.11";
        home.username = username;

        #Let Home Manager install and manage itself.
        programs.home-manager.enable = true;

        imports = [inputs.hyprland.homeManagerModules.default];
        home.homeDirectory = "/home/${home.username}";

        nix = {
          package = pkgs.nixVersions.stable;
          extraOptions = ''
            experimental-features = nix-command flakes
          '';
        };
      })
    ]
    ++ (builtins.attrValues self.home-managerModules);

  mkHome = {system ? "x86_64-linux", ...} @ hmConfig: {
    pkgs = self.lib'.internal.mkPkgsWithOverlays system;
    extraSpecialArgs = {inherit inputs self;};
    modules = mkHomeModules hmConfig;
  };
}
