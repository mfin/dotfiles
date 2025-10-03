{ config, pkgs, ... }:

{
  programs.granted = {
    enable = true;

    enableZshIntegration = true;
  };
}
