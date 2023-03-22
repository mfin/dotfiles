# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)

{ inputs, lib, config, pkgs, ... }: {
  # You can import other home-manager modules here
  imports = [
    ./autorestic.nix
    ./kitty.nix
    ./atuin.nix
    ./autojump.nix
    ./bottom.nix
    ./broot.nix
    ./direnv.nix
    ./dunst.nix
    ./easyeffects.nix
    ./exa.nix
    ./fonts.nix
    ./fzf.nix
    ./git.nix
    ./gitui.nix
    ./go.nix
    ./gtk.nix
    ./gpg-agent.nix
    ./hyprland-nvidia.nix
    ./neovim.nix
    ./nnn.nix
    ./packages.nix
    ./zellij.nix
    ./zsh.nix
  ] ++ lib.optional (builtins.pathExists "/home/mfin/.private/private.nix") "/home/mfin/.private/private.nix";

  nixpkgs = {
    # You can add overlays here
    overlays = [
      (self: super: {
        waybar =
          let
            hyprctl = "${pkgs.hyprland}/bin/hyprctl";
            waybarPatchFile = import ./workspace-patch.nix { inherit pkgs hyprctl; };
          in super.waybar.overrideAttrs (oldAttrs: {
          mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
          patches = (oldAttrs.patches or [ ]) ++ [ waybarPatchFile ];
        });
      })
    ];
    # Configure your nixpkgs instance
    config = {
      # Disable if you don't want unfree packages
      allowUnfree = true;
      # Workaround for https://github.com/nix-community/home-manager/issues/2942
      allowUnfreePredicate = (_: true);
    };
  };

  home = {
    username = "mfin";
    homeDirectory = "/home/mfin";

    sessionVariables = {
      # NIXOS_OZONE_WL = "1";
      LANG = "en_US.UTF-8";
      LC_ALL = "en_US.UTF-8";
      VISUAL = "nvim";
      EDITOR = "nvim";
    };
  };

  # services.wlsunset = {
  #   enable = true;

  #   latitude = "46.057273211531864";
  #   longitude = "14.507251116866733";

  #   temperature = {
  #     day = 5000;
  #     night = 3400;
  #   };
  # };

  # Add stuff for your user as you see fit:
  # home.packages = with pkgs; [ steam ];

  # Enable home-manager and git
  programs.home-manager.enable = true;

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";
  programs.swaylock.settings = {
    clock = true;
    indicator = true;
    indicator-radius = 120;
    grace = 2;
    timestr = "%H:%M";
    datestr = "%a, %d.%m.%Y";
    screenshots = true;
    effect-pixelate = 10;
    fade-in = 0.2;
    font = "JetBrainsMono Nerd Font";
    font-size = 48;
    hide-keyboard-layout = true;

    ring-color = "000000";
    line-color = "ffffff";
    inside-color = "000000";
    separator-color = "000000";
    text-color = "ffffff";
  };

  services.gnome-keyring = {
    enable = true;
    components = [ "secrets" "pkcs11" ];
  };

  xdg.mime.enable = true;

  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "x-scheme-handler/https" = "firefox.desktop";
      "x-scheme-handler/http" = "firefox.desktop";
    };
  };

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "22.11";
}
