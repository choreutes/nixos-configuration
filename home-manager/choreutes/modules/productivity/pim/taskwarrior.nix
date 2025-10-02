{
  config,
  pkgs,
  ...
}:

{
  config = {
    programs.taskwarrior = {
      enable = true;

      package = pkgs.taskwarrior3;
    };
  };
}
