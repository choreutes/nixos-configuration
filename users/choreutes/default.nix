{ config, pkgs, ... }:

{
  users.users.choreutes = {
    isNormalUser = true;

    group = "users";
    extraGroups = [ "wheel" "network" "cdrom" ];

    passwordFile = "/etc/nixos/configuration.d/users/choreutes/login_password.pw";

    packages = with pkgs; [
      home-manager
    ];

    useDefaultShell = true;
  };
}
