{ config, pkgs, ... }:

{
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
