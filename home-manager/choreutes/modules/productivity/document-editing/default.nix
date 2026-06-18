{
  config,
  pkgs,
  ...
}:

{
  imports = [
    ./latex.nix
  ];

  config = {
    home.packages = with pkgs; [
      libreoffice-qt-fresh
      typst
    ];
  };
}
