{
  config,
  ...
}:

{
  imports = [
    ./acme.nix
    ./nextcloud.nix
    ./nginx.nix
  ];

  config = {
    networking.firewall.allowedTCPPorts = [ 80 443 ];
  };
}
