{ config, pkgs, ... }:

{
  networking.wireless = {
    enable = true;

    userControlled = {
      enable = true;
      group = "network";
    };
  };

  services.connman.enable = true;

  users.groups.network = { };
}
