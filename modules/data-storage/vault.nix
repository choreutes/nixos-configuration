{
  pkgs,
  ...
}:

{
  config = {
    environment = {
      etc.crypttab.text = ''
        vault1 /dev/disk/by-uuid/b6072328-3fe3-41ae-94f8-598bd68ea2c0 /etc/secrets/vault_key noauto
        vault2 /dev/disk/by-uuid/d6eb7870-79da-4f96-a5e4-b88eb807249e /etc/secrets/vault_key noauto
        '';

      systemPackages = with pkgs; [
        hdparm
      ];
    };

    fileSystems."/vault" = {
      device = "/dev/disk/by-uuid/bf013eef-2915-42df-b4c5-fa97c6f83812";
      fsType = "btrfs";
      options = [
        "noauto"
      ];
    };
  };
}
