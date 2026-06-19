{
  config,
  lib,
  ...
}:

{
  imports = [
    ./document-editing
    ./document-management
    ./e-mail
    ./finance
    ./pim
  ];

  options = with lib; {
    host-specific.productivity.enable = mkOption {
      description = "Whether to enable programs and config related to productivity";
      default = false;
      example = true;
      type = with types; bool;
    };
  };
}
