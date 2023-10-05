{ config, pkgs, ... }:

{
  services.openssh = {
    enable = true;

    extraConfig = ''
      StreamLocalBindUnlink yes
    '';

    openFirewall = true;
  };
}
