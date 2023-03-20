{ config, pkgs, ... }:

{
  programs.autojump = {
    enable = true;
    enableZshIntegration = true;
  };
}
