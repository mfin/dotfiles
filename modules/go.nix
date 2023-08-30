{ config, pkgs, ... }:

{
  programs.go = {
    enable = true;

    goPath = ".go";
  };
}
