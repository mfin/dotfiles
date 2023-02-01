{ config, pkgs, ... }:

{
  programs.fzf = {
    enable = true;
    enableZshIntegration = true;

    defaultCommand = "fd -t f";
  };
}
