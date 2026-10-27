{
  config,
  pkgs,
  ...
}:

{
  config = {
    home.packages = with pkgs; [
      concord-tui
      xivlauncher
    ];
  };
}
