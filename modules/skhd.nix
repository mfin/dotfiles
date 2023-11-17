{ config, pkgs, ... }:

{
  home.file.".config/skhd/skhdrc".source = ./skhd/skhdrc;
}
