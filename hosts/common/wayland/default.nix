{ inputs, lib, config, pkgs, ... }:

{
  # services.greetd = {
  #   enable = true;
  #   settings = {
  #     default_session = {
  #       command = "${pkgs.greetd.tuigreet}/bin/tuigreet --cmd Hyprland --time --remember --remember-session";
  #       user = "greeter";
  #     };
  #   };
  # };

  xdg.portal = {
    enable = true;
    wlr.enable = true;
    # extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };

  services.xserver = {
    enable = true;

    displayManager.gdm.enable = true;
    displayManager.gdm.wayland = true;

    # displayManager.sddm = {
    #   enable = true;
    #   sessionPackages = [inputs.hyprland.packages.${pkgs.hostPlatform.system}.default];

    #   settings = {
    #     Autologin = {
    #       User = "mfin";
    #       Session = "hyprland.desktop";
    #     }:
    #   };
    # };

    libinput = {
      enable = true;

      mouse.accelProfile = "flat";
      mouse.accelSpeed = "0";
      mouse.middleEmulation = false;

      touchpad.naturalScrolling = true;
    };
  };
}
