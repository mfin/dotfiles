{ config, pkgs, ... }:

{
  programs.obs-studio = {
    enable = true;

    plugins = with pkgs.obs-studio-plugins; [
      input-overlay
      obs-pipewire-audio-capture
    ];
  };
}
