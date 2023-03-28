{ config, pkgs, ... }:

{
  programs.alacritty = {
    enable = true;

    settings = {
      font = {
        normal = {
          family = "JetBrainsMono Nerd Font";
          style = "Medium";
        };

        bold = {
          family = "JetBrainsMono Nerd Font";
          style = "ExtraBold";
        };

        italic = {
          family = "JetBrainsMono Nerd Font";
          style = "Medium Italic";
        };

        bold_italic = {
          family = "JetBrainsMono Nerd Font";
          style = "ExtraBold Italic";
        };

        size = 9;
      };

      window = {
        padding = {
          x = 5;
          y = 5;
        };
      };

      selection = {
        save_to_clipboard = true;
      };

      cursor = {
        style = "Underline";
        blinking = "Off";
      };

      colors = {
        primary = {
          background = "#000000";
          foreground = "#ffffff";
        };

        normal = {
          black = "#111111";
          red = "#d36265";
          green = "#aece91";
          yellow = "#e7e18c";
          blue = "#5297cf";
          magenta = "#963c59";
          cyan = "#5e7175";
          white = "#bebebe";
        };

        bright = {
          black = "#666666";
          red = "#ef8171";
          green = "#cfefb3";
          yellow = "#fff796";
          blue = "#74b8ef";
          magenta = "#b85e7b";
          cyan = "#a3babf";
          white = "#ffffff";
        };
      };
    };
  };
}
