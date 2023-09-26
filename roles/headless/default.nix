{ config, pkgs, ... }:

{
  imports = [
    ../../services/sshd.nix
  ];

  networking = {
    firewall.enable = true;

    nftables.enable = true;
  };
}
