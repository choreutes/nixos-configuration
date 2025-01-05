{ config, pkgs, ... }:

{
  programs.texlive = {
    enable = true;

    extraPackages = tpkgs: {
      inherit (tpkgs)

      collection-basic

      collection-bibtexextra
      collection-latex
      collection-latexextra
      collection-latexrecommended
      collection-luatex
      collection-plaingeneric

      collection-fontsextra
      collection-fontsrecommended
      collection-fontutils

      collection-langenglish
      collection-langgerman

      collection-mathscience
      collection-pictures
      collection-publishers

      latexmk;
    };
  };
}
