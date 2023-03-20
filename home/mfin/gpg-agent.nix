{ config, pkgs, ... }:

{
  services.gpg-agent = {
    enable = true;
    
    pinentryFlavor= "gtk2";
    enableSshSupport = true;
  };
}
