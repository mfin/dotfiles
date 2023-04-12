{ config, pkgs, ... }:

{
  home.sessionVariables = {
    GTK_THEME = "WhiteSur-Dark-solid-grey";
    XCURSOR_THEME = "phinger-cursors-light";
    # QT_QPA_PLATFORM = "wayland;xcb";
  };

  home.pointerCursor = {
    package = pkgs.phinger-cursors;
    name = "phinger-cursors-light";
    size = 24;
    gtk.enable = true;
    x11.enable = true;
  };

  gtk = {
    enable = true;

    iconTheme = {
      name = "WhiteSur-grey-dark";
      package = pkgs.whitesur-icon-theme.override ({
        boldPanelIcons = true;
        themeVariants = [ "grey" ];
      });
    };

    theme = {
      name = "WhiteSur-Dark-solid-grey";
      package = pkgs.whitesur-gtk-theme.override ({
        themeVariants = [ "grey" ];
      });
    };

    cursorTheme = {
      name = "phinger-cursors-light";
    };

    font = {
      name = "Noto Sans";
      size = 10;
    };

    gtk3.extraConfig = {
      gtk-cursor-theme-name = "phinger-cursors-light";
      gtk-application-prefer-dark-theme = 1;
      gtk-xft-antialias = 1;
      gtk-xft-hinting = 1;
      gtk-xft-hintstyle = "hintslight";
      gtk-xft-rgba = "rgb";
    };

    gtk2.extraConfig = ''
      gtk-xft-antialias=1
      gtk-xft-hinting=1
      gtk-xft-hintstyle="hintslight"
      gtk-xft-rgba="rgb"
    '';
  };

  qt = {
    platformTheme = "gtk";
  };
}
