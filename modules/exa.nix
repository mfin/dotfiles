{ config, pkgs, ... }:

{
  programs.exa = {
    enable = true;

    enableAliases = true;
    icons = true;
  };
}
