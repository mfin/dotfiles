{ config, pkgs, ... }:

{
  services.gpg-agent = {
    enable = true;
    enableZshIntegration = true;

    enableSshSupport = true;
  };
}
