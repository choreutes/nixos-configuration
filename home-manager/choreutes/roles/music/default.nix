{ config, pkgs, ... }:

{
  imports = [
    ../../programs/beets
  ];

  home.packages = with pkgs; [
    cantata
    ffmpeg
    flac
    kid3
    vorbis-tools
  ];

  services = {
    mpd = {
      enable = true;
      musicDirectory = "${config.home.homeDirectory}/Musik";
    };
  };
}
