{ config, pkgs, ... }:

{
  imports = [
    ./sshd.nix
  ];

  networking = {
    firewall.enable = true;

    nftables.enable = true;
  };
}
