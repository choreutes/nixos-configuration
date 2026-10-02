{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.host-specific.media.music;
in {
  options = with lib; {
    host-specific.media.music = {
      enable = mkOption {
        description = "Whether to enable music related tools";
        default = false;
        example = true;
        type = with types; bool;
      };

      dir = mkOption {
        description = "The location of the music directory";
        default = "${config.home.homeDirectory}/Musik";
        type = with types; uniq str;
      };

      lib = mkOption {
        description = "The location of the beets library database";
        default = "${config.xdg.dataHome}/beets/library.db";
        type = with types; uniq str;
      };
    };
  };

  config = {
    home.packages = with pkgs; [
      ffmpeg
      flac
      vorbis-tools
    ];

    programs.beets = {
      enable = true;

      settings = {
        directory = "${cfg.dir}";
        library = "${cfg.lib}";

        import = {
          write = false;
        };

        paths = {
          default = "$genre/$albumartist/$album%aunique{}/$track - $title";
          "genre:Ballroom" = "Ballroom/$album%aunique{}/$track - $title";
          "genre:Latin" = "Latin/$album%aunique{}/$track - $title";
          "genre:Soundtrack" = "Soundtracks/$album%aunique{}/$track - $title";
        };

        plugins = "convert info";
      };
    };
  };
}
