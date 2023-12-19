{ config, pkgs, ... }:

{
  users.users.choreutes = {
    isNormalUser = true;

    group = "users";
    extraGroups = [ "wheel" "video" "network" "cdrom" ];

    openssh.authorizedKeys.keyFiles = [ /etc/nixos/configuration.d/users/choreutes/ssh_key.pub ];

    hashedPasswordFile = "/etc/nixos/configuration.d/users/choreutes/login_password.pw";

    packages = with pkgs; [
      home-manager
    ];

    useDefaultShell = true;
  };
}
