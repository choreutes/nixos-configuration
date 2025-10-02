{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.host-specific.papis;
in {
  options = with lib; {
    host-specific.papis.library-dir = mkOption{
      type = with types; uniq str;
    };
  };

  config = {
    programs.papis = {
      enable = true;

      libraries.Library = {
        isDefault = true;

        settings = {
          dir = "${cfg.library-dir}";
          header-format = ''
            {doc.html_escape[author]}
              <b>“{doc.html_escape[title]}”</b>
              <span>  <ansiblue>{doc.html_escape[tags]}</ansiblue></span>
            '';
        };
      };

      settings = {
        database-backend = "papis";
        editor = "nvim";
        file-browser = "ranger";
        sort-field = "year";

        "tui-editmode" = "vi";
        "tui-options_list.selected_margin_style" = "fg:ansiblue";
        "tui-options_list.unselected_margin_style" = "";
      };
    };
  };
}
