{
  config,
  pkgs,
  ...
}:

{
  config = {
    home.packages = with pkgs; [
      xivlauncher
    ];
  };
}
