{ config, pkgs, ... }:

{
  programs.kitty = {
    enable = true;

    font = {
      name = "JetBrainsMono Nerd Font";
      size = 9;
    };

    settings = {
      scrollback_lines = 10000;
      placement_strategy = "center";

      allow_remote_control = "yes";
      enable_audio_bell = "no";
      visual_bell_duration = "0.1";

      copy_on_select = "clipboard";

      selection_foreground = "none";
      selection_background = "none";

      window_padding_width = 5;

      # colors
      foreground = "#ffffff";
      background = "#000000";
      # black
      color0 = "#111111";
      color8 = "#666666";
      # red
      color1 = "#d36265";
      color9 = "#ef8171";
      # green
      color2 = "#aece91";
      color10 = "#cfefb3";
      # yellow
      color3 = "#e7e18c";
      color11 = "#fff796";
      # blue
      color4 = "#5297cf";
      color12 = "#74b8ef";
      # magenta
      color5 = "#963c59";
      color13 = "#b85e7b";
      # cyan
      color6 = "#5e7175";
      color14 = "#a3babf";
      # white
      color7 = "#bebebe";
      color15 = "#ffffff";
    };

    keybindings = {
      "ctrl+equal" = "change_font_size all +2.0";
      "ctrl+minus" = "change_font_size all -2.0";
      "ctrl+0" = "change_font_size all 0";
    };
  };
}
