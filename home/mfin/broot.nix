{ config, pkgs, ... }:

{
  programs.broot = {
    enable = true;
    enableZshIntegration = true;
  };
}
