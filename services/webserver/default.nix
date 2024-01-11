{ config, pkgs, ... }:

{
  imports = [
    ./acme.nix
    ./nextcloud.nix
    ./nginx.nix
  ];

  networking.firewall.allowedTCPPorts = [ 80 443 ];
}
