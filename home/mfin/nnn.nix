{ config, pkgs, ... }:

{
  programs.nnn = {
    enable = true;

    package = pkgs.nnn.override ({ withNerdIcons = true; });

    plugins = {
      src = ./nnn/plugins;

      mappings = {
        "w" = "wsl-open";
        "e" = "edit-in-code";
      };
    };
  };
}
