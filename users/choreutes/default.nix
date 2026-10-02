{
  config,
  pkgs,
  ...
}:

{
  users.users.choreutes = {
    isNormalUser = true;

    group = "users";
    extraGroups = [ "wheel" "video" "network" "cdrom" ];

    openssh.authorizedKeys.keyFiles = [ ./ssh_key.pub ];

    hashedPasswordFile = "/etc/secrets/choreutes/login_password.txt";

    packages = with pkgs; [
      home-manager
    ];

    useDefaultShell = true;
  };
}
