{ inputs, lib, config, pkgs, ... }:

{
  nixpkgs = {
    config = {
      allowUnfree = true;
    };
  };

  nix = {
    registry = lib.mapAttrs (_: value: { flake = value; }) inputs;
    nixPath = lib.mapAttrsToList (key: value: "${key}=${value.to.path}") config.nix.registry;

    gc = {
      automatic = true;
      options = "--delete-older-than 8d";
    };

    settings = {
      experimental-features = "nix-command flakes";
      auto-optimise-store = true;
    };
  };

  boot.loader.systemd-boot.enable = true;
  boot.loader.systemd-boot.configurationLimit = 10;
  boot.loader.grub.enable = false;

  boot.kernelParams = [ "quiet" ];
  boot.initrd.systemd.enable = true;
  boot.consoleLogLevel = 3;

  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot/efi";

  boot.plymouth = {
    theme = "breeze";
    enable = true;
  };

  time.timeZone = "Europe/Ljubljana";
  i18n.defaultLocale = "en_US.UTF-8";

  console = {
    useXkbConfig = true;
  };

  services.xserver = {
    layout = "gb,si";
    xkbOptions = "grp:alt_shift_toggle";
  };
}
