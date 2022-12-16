{ config, pkgs, ... }:

{
  home.file.".config/ranger" = {
    source = ./ranger;
    recursive = true;
  };
}
