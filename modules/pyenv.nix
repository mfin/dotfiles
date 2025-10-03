{ config, pkgs, ... }:

{
  programs.pyenv = {
    enable = true;

    enableZshIntegration = true;
  };
}
