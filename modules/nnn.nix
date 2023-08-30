{ config, pkgs, ... }:

{
  programs.nnn = {
    enable = true;

    package = pkgs.nnn.override ({ withEmojis = true; });

    plugins = {
      src = ./nnn/plugins;

      mappings = {
        "w" = "wsl-open";
        "e" = "edit-in-code";
      };
    };
  };
}
