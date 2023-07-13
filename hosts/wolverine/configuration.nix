{ inputs, lib, config, pkgs, ... }:

let
  user = "mfin";
in
{
  imports = [
    ../common/core
    ../common/users
    ../common/network
    ../common/nvidia
    ../common/wayland
  ];

  boot.initrd.luks.devices = {
    root = {
      device = "/dev/disk/by-partlabel/enc";
      preLVM = true;
      allowDiscards = true;
    };
  };

  networking.hostName = "wolverine";

  environment.sessionVariables = rec {
    # Will break SDDM if running X11
    QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
    WLR_NO_HARDWARE_CURSORS = "1";
    WLR_RENDERER_ALLOW_SOFTWARE = "1";
    MOZ_ENABLE_WAYLAND = "1";

    NIXOS_OZONE_WL = "1";
  };

  programs.zsh.enable = true;
  programs.hyprland.enable = true;
  programs.xwayland.enable = true;
  programs.dconf.enable = true;
  programs.seahorse.enable = true;
  services.dbus.enable = true;
  security.polkit.enable = true;
  services.tlp = {
    enable = true;
    settings = {
      CPU_SCALING_GOVERNOR_ON_AC = "performance";
      CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
    };
  };
  services.acpid.enable = true;
  services.fstrim.enable = true;
  security.pam.services.swaylock = {};

  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

  # hardware.fancontrol.enable = true;
  # hardware.fancontrol.config = ''
  #   pwmconfig goes here
  # '';

  # virtualisation.virtualbox.guest.enable = true;
  # virtualisation.virtualbox.guest.x11 = true;

  # xdg.portal = {
  #   enable = true;
  #   wlr.enable = true;
  #   extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  # };

  # services.xserver = {
  #   enable = true;
  #   # displayManager.sddm.enable = true;
  #   # displayManager.sddm.settings.Wayland.SessionDir = "${pkgs.hyprland.plasma-workspace}/share/wayland-sessions";
  # };

  environment.systemPackages = with pkgs; [
    acpi
    at-spi2-core
    cage
    efibootmgr
    greetd.gtkgreet
    inputs.hyprland-contrib.packages.${pkgs.hostPlatform.system}.grimblast
    inputs.hyprland-contrib.packages.${pkgs.hostPlatform.system}.hyprprop
    libsecret
    gtk-engine-murrine
    gnome3.gnome-themes-extra
    qt5.qtwayland
    qt5.qtbase
    libsForQt5.qtstyleplugin-kvantum
    libsForQt5.qt5ct
    # qt6.qtwayland
    libva
    libva-utils
    lm_sensors
    nfs-utils
    pciutils
    polkit_gnome
    qmk-udev-rules
    smartmontools
    wayland
    wireguard-tools
  ];

  fonts = {
    fonts = with pkgs; [
      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji
      material-symbols
      font-awesome
      (nerdfonts.override {fonts = ["JetBrainsMono"];})
    ];

    enableDefaultFonts = false;

    # user defined fonts
    # the reason there's Noto Color Emoji everywhere is to override DejaVu's
    # B&W emojis that would sometimes show instead of some Color emojis
    fontconfig = {
      hinting.autohint = true;

      defaultFonts = {
        serif = ["Noto Serif" "Noto Color Emoji"];
        sansSerif = ["Noto Sans" "Noto Color Emoji"];
        monospace = ["JetBrainsMono Nerd Font" "Noto Color Emoji"];
        emoji = ["Noto Color Emoji"];
      };
    };
  };

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
    jack.enable = true;
  };

  # services.greetd = {
  #   enable = true;

  #   settings = {
  #     default_session = {
  #       command = "${pkgs.cage}/bin/cage -s -- ${pkgs.greetd.gtkgreet}";
  #     };
  #   };
  # };

  environment.etc."greetd/environments".text = ''
    Hyprland
    zsh
  '';

  nixpkgs.overlays = [
    (self: super: {
      waybar = super.waybar.overrideAttrs (oldAttrs: {
        mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
      });
    })
  ];

  services.udev.packages = with pkgs; [
    qmk-udev-rules
  ];

  services.printing = {
    enable = true;

    drivers = [ pkgs.cups-brother-mfcl2750dw ];
  };

  services.avahi.enable = true;
  services.avahi.nssmdns = true;
  services.avahi.openFirewall = true;
  services.gvfs.enable = true;
  virtualisation.libvirtd.enable = true;

  virtualisation.docker = {
    enable = true;

    rootless = {
      enable = true;
      setSocketVariable = true;
    };
  };

  networking.firewall.checkReversePath = false;

  boot.loader.systemd-boot.consoleMode = "max";

  services.gnome.at-spi2-core.enable = true;
  services.gnome.gnome-keyring.enable = true;

  services.fwupd.enable = true;
  services.smartd.enable = true;

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "22.11";
}
