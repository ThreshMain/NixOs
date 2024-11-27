{
  pkgs,
  config,
  lib,
  ...
}: let
  nextcloud-domain = "cloud.${config.domain}";
  service = config.services.nextcloud;
  cfg = service.config;
in {
  generated = {
    services.mariadb.enable = lib.mkDefault true;
    services.nginx.enable = lib.mkDefault true;
  };

  services = {
    nextcloud = {
      enable = true;
      package = pkgs.nextcloud30;
      hostName = lib.mkDefault nextcloud-domain;
      https = lib.mkDefault true;
      home = lib.mkDefault "/nextcloud";
      maxUploadSize = "32G";
      config = {
        dbtype = "mysql";
        dbpassFile = "/var/nextcloud-db-pass";
        adminpassFile = "/var/nextcloud-admin-pass";
        extraTrustedDomains = [service.hostName];
      };
    };
    mysql = {
      ensureDatabases = [cfg.dbname];
      ensureUsers = [
        {
          name = cfg.dbuser;
          ensurePermissions = {"${cfg.dbname}.*" = "ALL PRIVILEGES";};
        }
      ];
    };
    nginx = {
      # Setup Nextcloud virtual host to listen on ports
      virtualHosts = {
        "${service.hostName}" = {
          ## Force HTTP redirect to HTTPS
          forceSSL = lib.mkDefault true;
          ## LetsEncrypt
          enableACME = lib.mkDefault true;
          http3 = lib.mkDefault true;
        };
      };
    };
  };
}
