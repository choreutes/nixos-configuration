{ config, pkgs, ... }:

{
  programs.gpg = {
    enable = true;

    settings = {
      charset = "utf-8";

      keyid-format = "0xlong";

      cert-digest-algo = "SHA512";
      personal-digest-preferences = "SHA512";
      default-preference-list = "SHA512 SHA384 SHA256 SHA224 AES256 AES192 AES CAST5 ZLIB BZIP2 ZIP Uncompressed";
    };
  };
}
