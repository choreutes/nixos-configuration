{
  config,
  ...
}:

{
  config = {
    programs.git = {
      enable = true;

      signing.key = "99CA7A000D9729CE!";

      userName = "Tobias Schmalz";
      userEmail = "github@choreutes.de";

      ignores = [
        "*.aux"
        "*.swp"
      ];
    };
  };
}
