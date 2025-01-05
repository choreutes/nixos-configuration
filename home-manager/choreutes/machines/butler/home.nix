{ config, pkgs, ... }:

{
  imports = [
    ../../roles/gaming
    ../../roles/graphical-kde
    ../../roles/music
    ../../roles/office
    ../../roles/personal

    ../../features/common
    ../../features/productivity
  ];

  home = {
    packages = with pkgs; [
      gimp
      k3b
    ];

    sessionVariables = {
      LEDGER_HOME = "${config.home.homeDirectory}/Vault/Finanzen";
    };

    stateVersion = "20.09";
  };

  programs.yt-dlp.enable = true;
}
