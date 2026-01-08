{
  config,
  ...
}:

{
  config = {
    programs.git = {
      enable = true;

      signing.key = "99CA7A000D9729CE!";

      ignores = [
        "*.aux"
        "*.swp"
      ];

      settings = {
        user = {
          name = "Tobias Schmalz";
          email = "github@choreutes.de";
        };
      };
    };
  };
}
