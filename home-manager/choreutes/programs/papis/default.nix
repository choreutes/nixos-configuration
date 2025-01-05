{ config, pkgs, ... }:

{
  programs.papis = {
    enable = true;

    libraries.Library = {
      isDefault = true;

      settings = {
        dir = "~/Library";
        header-format = ''
          {doc.html_escape[author]}
            <b>“{doc.html_escape[title]}”</b>
            <span>  <ansiblue>{doc.html_escape[tags]}</ansiblue></span>
          '';
      };
    };

    settings = {
      database-backend = "whoosh";
      editor = "nvim";
      file-browser = "ranger";
      sort-field = "year";
      whoosh-schema-fields = "['type']";

      "tui-editmode" = "vi";
      "tui-options_list.selected_margin_style" = "fg:ansiblue";
      "tui-options_list.unselected_margin_style" = "";
    };
  };
}
