{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.host-specific.productivity.document-management.papis;
in {
  options = with lib; {
    host-specific.productivity.document-management.papis = {
      research-dir = mkOption {
        type = with types; uniq str;
      };

      textbook-dir = mkOption {
        type = with types; uniq str;
      };
    };
  };

  config = {
    programs.papis = {
      enable = true;

      libraries = {
        Research = {
          isDefault = true;

          settings = {
            dir = "${cfg.research-dir}";
            header-format = ''
              {doc.html_escape[author]}
                <b>“{doc.html_escape[title]}”</b>
                <span>  <ansiblue>{doc.html_escape[tags]}</ansiblue></span>
              '';
            whoosh-schema-fields = "['journaltitle', 'booktitle']";
          };
        };

        Textbooks = {
          settings = {
            dir = "${cfg.textbook-dir}";
            header-format = ''
              {doc.html_escape[author]}
                <b>“{doc.html_escape[title]}”</b>
                <span>  <ansiblue>{doc.html_escape[tags]}</ansiblue></span>
              '';
          };
        };
      };

      settings = {
        database-backend = "whoosh";
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
