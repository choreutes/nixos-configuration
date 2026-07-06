{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.host-specific.productivity.document-editing;
in
{
  config = lib.mkIf cfg.enable {
    programs.texlive = {
      enable = true;

      extraPackages = tpkgs: {
        inherit (tpkgs)

        collection-basic

        collection-bibtexextra
        collection-binextra
        collection-latex
        collection-latexextra
        collection-latexrecommended
        collection-luatex
        collection-plaingeneric

        collection-fontsextra
        collection-fontsrecommended
        collection-fontutils

        # For some reason this is in the XeTeX collection...
        realscripts

        collection-langenglish
        collection-langgerman

        collection-mathscience
        collection-pictures
        collection-publishers

        # This can be useful when working with the lipsum package.
        # It is contained in the langeuropean collection,
        # but I don't want the other languages (yet).
        babel-latin
        hyphen-latin;
      };
    };
  };
}
