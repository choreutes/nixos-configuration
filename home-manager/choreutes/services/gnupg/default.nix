{ config, pkgs, ... }:

{
  programs.ssh = {
    enable = true;

    matchBlocks = {
      "opal.choreutes.de" = {
        forwardAgent = true;

        remoteForwards = [
          {
            bind.address = "/run/user/1000/gnupg/S.gpg-agent";
            host.address = "/run/user/1000/gnupg/S.gpg-agent.extra";
          }
        ];
      };
    };
  };

  services.gpg-agent = {
    enable = true;

    enableExtraSocket = true;
    enableSshSupport = true;

    pinentryPackage = pkgs.pinentry-qt;

    sshKeys = [ "178D43591E8A412D0AA5098567E5AEF509BB3C0A" ];
  };
}
