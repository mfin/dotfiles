{ config, pkgs, ... }:

{
  home.file.".config/yabai/yabairc" = {
    source = ./yabai/yabairc;

    executable = true;
  };
}
