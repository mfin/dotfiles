{ config, pkgs, ... }:

{
  programs.nnn = {
    enable = true;

    plugins = {
      src = ./nnn/plugins;

      mappings = {
        "w" = "wsl-open";
        "e" = "edit-in-code";
      };
    };
  };
}
