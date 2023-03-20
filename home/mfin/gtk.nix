{ config, pkgs, ... }:

{
  gtk = {
    enable = true;

    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };

    theme = {
      name = "Adwaita";
      package = pkgs.gnome3.gnome-themes-extra;
    };

    font =
      {
        name = "Noto Sans 10";
      };

    gtk3.extraConfig = {
      gtk-cursor-theme-name = "breeze";
      gtk-application-prefer-dark-theme = 1;
    };
  };

  qt = {
    platformTheme = "gtk";
  };
}
