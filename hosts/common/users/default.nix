{ inputs, lib, config, pkgs, ... }:

{
  # sops.secrets."users.mfin.password".neededForUsers = true;

  users.users = {
    mfin = {
      # passwordFile = config.sops.secrets."users.mfin.password".path;
      initialPassword = "justtemppassword";
      isNormalUser = true;
      extraGroups = [ "wheel" "users" "networkmanager" "audio" "video" "disk" "kvm" "libvirtd" "docker" ];
      shell = pkgs.zsh;
    };
  };

  security.sudo.wheelNeedsPassword = false;
}
