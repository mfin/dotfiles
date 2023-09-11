{ config, pkgs, ... }:

{
  programs.eza = {
    enable = true;

    enableAliases = true;
  };
}
