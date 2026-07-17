{
  config,
  ...
}:

{
  imports = [
    ./acme.nix
    ./nextcloud.nix
    ./nginx.nix
    ./vikunja.nix
  ];

  config = {
    networking.firewall.allowedTCPPorts = [ 80 443 ];
  };
}
