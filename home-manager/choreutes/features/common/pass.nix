{
  config,
  pkgs,
  ...
}:

{
  config = {
    programs.password-store = {
      enable = true;

      package = pkgs.pass-wayland;

      settings = {
        PASSWORD_STORE_DIR = "${config.xdg.dataHome}/password-store";
      };
    };
  };
}
