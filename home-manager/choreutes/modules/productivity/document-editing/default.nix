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
      libreoffice-qt6
      typst
    ];
  };
}
