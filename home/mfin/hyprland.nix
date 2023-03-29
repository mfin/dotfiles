{ config, pkgs, ... }:

{
  home.file.".wall.png".source = ../../lib/wall/wall.png;

  wayland.windowManager.hyprland = {
    enable = true;

    extraConfig = ''
      exec-once = ${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1

      exec-once = swww init && swww img ~/.wall.png
      exec-once = swayidle -w timeout 300 'swaylock -f' timeout 600 'hyprctl dispatch dpms off' resume 'hyprctl dispatch dpms on' before-sleep 'swaylock -f' & disown

      exec-once = wl-paste --type text --watch cliphist store
      exec-once = wl-paste --type image --watch cliphist store

      exec-once = synology-drive

      monitor=eDP-1,preferred,auto,1
      monitor=,preferred,auto,auto

      # exec-once = waybar

      # See https://wiki.hyprland.org/Configuring/Keywords/ for more

      # Source a file (multi-file configs)
      # source = ~/.config/hypr/myColors.conf

      misc {
        disable_hyprland_logo = true
      }

      # For all categories, see https://wiki.hyprland.org/Configuring/Variables/
      input {
          kb_layout = gb,si
          kb_options = grp:alt_shift_toggle

          repeat_delay = 300

          follow_mouse = 1

          touchpad {
              natural_scroll = no
          }

          accel_profile = flat
          sensitivity = -0.3 # -1.0 - 1.0, 0 means no modification.
      }

      gestures {
          workspace_swipe = true
      }

      general {
          # See https://wiki.hyprland.org/Configuring/Variables/ for more

          gaps_in = 5
          gaps_out = 10
          border_size = 2
          col.active_border = rgba(7EBAE4ff) rgba(7EBAE4ff) 45deg
          col.inactive_border = rgba(595959cc)

          layout = dwindle
      }

      decoration {
          # See https://wiki.hyprland.org/Configuring/Variables/ for more

          rounding = 4
          blur = yes
          blur_size = 3
          blur_passes = 1
          blur_new_optimizations = on

          drop_shadow = yes
          shadow_range = 4
          shadow_render_power = 3
          col.shadow = rgba(1a1a1aee)

          dim_special = 0.4
      }

      animations {
          enabled = yes

          # Some default animations, see https://wiki.hyprland.org/Configuring/Animations/ for more

          bezier = myBezier, 0.05, 0.9, 0.1, 1.05

          animation = windows, 1, 7, myBezier
          animation = windowsOut, 1, 7, default, popin 80%
          animation = border, 1, 10, default
          animation = borderangle, 1, 8, default
          animation = fade, 1, 7, default
          animation = workspaces, 1, 6, default
      }

      dwindle {
          # See https://wiki.hyprland.org/Configuring/Dwindle-Layout/ for more
          pseudotile = yes # master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
          preserve_split = yes # you probably want this
          force_split = 2
          no_gaps_when_only = true
      }

      master {
          # See https://wiki.hyprland.org/Configuring/Master-Layout/ for more
          new_is_master = true
      }

      gestures {
          # See https://wiki.hyprland.org/Configuring/Variables/ for more
          workspace_swipe = on
          workspace_swipe_fingers = 4;
      }

      # Example per-device config
      # See https://wiki.hyprland.org/Configuring/Keywords/#executing for more
      device:epic mouse V1 {
          sensitivity = -0.5
      }

      # Example windowrule v1
      # windowrule = float, ^(kitty)$
      # Example windowrule v2
      # windowrulev2 = float,class:^(kitty)$,title:^(kitty)$
      # See https://wiki.hyprland.org/Configuring/Window-Rules/ for more

      windowrule = float, file_progress
      windowrule = float, confirm
      windowrule = float, dialog
      windowrule = float, download
      windowrule = float, notification
      windowrule = float, error
      windowrule = float, splash
      windowrule = float, confirmreset
      windowrule = float, title:Open File
      windowrule = float, title:Open Folder
      windowrule = float, title:branchdialog
      windowrule = float, title:Bluetooth Devices
      windowrule = float, pulsemixer
      windowrule = float, btop
      windowrule = float, mpv
      windowrule = float, Lxappearance
      windowrule = float, pavucontrol-qt
      windowrule = float, pavucontrol
      windowrule = float, file-roller
      windowrule = fullscreen, wlogout
      windowrule = float, title:wlogout
      windowrule = fullscreen, title:wlogout
      windowrule = idleinhibit focus, mpv
      windowrule = idleinhibit fullscreen, firefox
      windowrule = float, title:^(Media viewer)$
      windowrule = float, title:^(Volume Control)$
      windowrule = float, title:^(Picture-in-Picture)$
      windowrule = size 800 600, title:^(Volume Control)$
      windowrule = move 75 44%, title:^(Volume Control)$

      # See https://wiki.hyprland.org/Configuring/Keywords/ for more
      $mainMod = SUPER

      # Example binds, see https://wiki.hyprland.org/Configuring/Binds/ for more
      bind = $mainMod, Return, exec, alacritty
      bind = $mainMod, L, exec, swaylock -f
      bind = $mainMod, C, killactive,
      bind = $mainMod, M, exit,
      bind = $mainMod, E, exec, dolphin
      bind = $mainMod SHIFT, V, exec, cliphist list | wofi -dmenu | cliphist decode | wl-copy
      bind = $mainMod, V, togglefloating,
      bind = $mainMod, Space, exec, wofi --show drun -I
      bind = $mainMod, P, pseudo, # dwindle
      bind = $mainMod, J, togglesplit, # dwindle
      bind = , Print, exec, grimblast --notify copysave area
      bind = SHIFT, Print, exec, grimblast --notify copysave output

      # Move focus with mainMod + arrow keys
      bind = $mainMod, left, movefocus, l
      bind = $mainMod, right, movefocus, r
      bind = $mainMod, up, movefocus, u
      bind = $mainMod, down, movefocus, d

      # Switch workspaces with mainMod + [0-9]
      bind = $mainMod, 1, workspace, 1
      bind = $mainMod, 2, workspace, 2
      bind = $mainMod, 3, workspace, 3
      bind = $mainMod, 4, workspace, 4
      bind = $mainMod, 5, workspace, 5
      bind = $mainMod, 6, workspace, 6
      bind = $mainMod, 7, workspace, 7
      bind = $mainMod, 8, workspace, 8
      bind = $mainMod, 9, workspace, 9
      bind = $mainMod, 0, workspace, 10

      bind = $mainMod CTRL, left, movecurrentworkspacetomonitor, l
      bind = $mainMod CTRL, right, movecurrentworkspacetomonitor, r

      # Move active window to a workspace with mainMod + SHIFT + [0-9]
      bind = $mainMod SHIFT, 1, movetoworkspace, 1
      bind = $mainMod SHIFT, 2, movetoworkspace, 2
      bind = $mainMod SHIFT, 3, movetoworkspace, 3
      bind = $mainMod SHIFT, 4, movetoworkspace, 4
      bind = $mainMod SHIFT, 5, movetoworkspace, 5
      bind = $mainMod SHIFT, 6, movetoworkspace, 6
      bind = $mainMod SHIFT, 7, movetoworkspace, 7
      bind = $mainMod SHIFT, 8, movetoworkspace, 8
      bind = $mainMod SHIFT, 9, movetoworkspace, 9
      bind = $mainMod SHIFT, 0, movetoworkspace, 10

      # special workspace aka scratchpad
      bind = $mainMod SHIFT, S, movetoworkspace,special
      bind = $mainMod, S, togglespecialworkspace,

      # Scroll through existing workspaces with mainMod + scroll
      bind = $mainMod, mouse_down, workspace, e+1
      bind = $mainMod, mouse_up, workspace, e-1

      # Move/resize windows with mainMod + LMB/RMB and dragging
      bindm = $mainMod, mouse:272, movewindow
      bindm = $mainMod, mouse:273, resizewindow

      binde=, XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+
      bindl=, XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-

      bindl=, XF86MonBrightnessUp, exec, light -A 10
      bindl=, XF86MonBrightnessDown, exec, light -U 10

      bind=, XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
      bind=, XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle

      bind = $mainMod SHIFT, E, exec, code
      bind = $mainMod SHIFT, A, exec, alacritty --class pulsemixer -t pulsemixer -e pulsemixer
      bind = $mainMod SHIFT, T, exec, alacritty --class btop -t btop -e btop
      bind = $mainMod SHIFT, W, exec, firefox
      bind = $mainMod SHIFT, N, exec, obsidian
      bind = $mainMod SHIFT, L, exec, wlogout
      bind = $mainMod SHIFT, F, exec, thunar
      bind = $mainMod SHIFT, B, exec, blueman-manager

    '';
  };

  programs.waybar = {
    enable = true;

    systemd.enable = true;

    settings = {
      primary = {
        output = [ "eDP-1" ];
        layer = "top";
        position = "top";
        modules-left = [
          "custom/logo"
          "wlr/workspaces"
          "hyprland/window"
        ];

        modules-right = [
          "tray"
          "idle_inhibitor"
          "wireplumber"
          "battery"
          "clock"
        ];

        "custom/logo" = {
          format = "<span font='14'>󱄅</span>";
        };

        "wlr/workspaces" = {
          on-click = "activate";
        };

        "hyprland/window" = {
            format = "󰖯 {}";
        };

        idle_inhibitor = {
          format = "{icon}";
          format-icons = {
              activated = "󰅶";
              deactivated = "󰛊";
          };
        };

        wireplumber = {
          format = "{icon} {volume}%";
          format-muted = "󰖁";
          format-icons = ["󰕿" "󰖀" "󰕾"];
        };

        clock = {
          format = " {:%H:%M}";
          format-alt = " {:%A, %B %d, %Y (%R)}";
          tooltip-format = "<tt><small>{calendar}</small></tt>";
          calendar = {
            mode = "year";
            mode-mon-col = 3;
            weeks-pos = "right";
            on-scroll = 1;
            on-click-right = "mode";
            format = {
              months = "<span color='#ffead3'><b>{}</b></span>";
              days = "<span color='#ecc6d9'><b>{}</b></span>";
              weeks = "<span color='#99ffdd'><b>W{}</b></span>";
              weekdays = "<span color='#ffcc66'><b>{}</b></span>";
              today = "<span color='#ff6699'><b><u>{}</u></b></span>";
            };
          };
          actions =  {
            on-click-right = "mode";
            on-click-forward = "tz_up";
            on-click-backward = "tz_down";
            on-scroll-up = "shift_up";
            on-scroll-down = "shift_down";
          };
        };
      };

      secondary = {
        output = [ "DP-1" "DP-2" "DP-3" "DP-4" "DP-5" ];
        layer = "top";
        position = "top";
        modules-left = [
          "custom/logo"
          "wlr/workspaces"
          "hyprland/window"
        ];

        modules-right = [
          "clock"
        ];

        "custom/logo" = {
          format = "<span font='14'>󱄅</span>";
        };

        "wlr/workspaces" = {
          on-click = "activate";
        };

        "hyprland/window" = {
            format = "󰖯 {}";
        };

        clock = {
          format = " {:%H:%M}";
          format-alt = " {:%A, %B %d, %Y (%R)}";
          tooltip-format = "<tt><small>{calendar}</small></tt>";
          calendar = {
            mode = "year";
            mode-mon-col = 3;
            weeks-pos = "right";
            on-scroll = 1;
            on-click-right = "mode";
            format = {
              months = "<span color='#ffead3'><b>{}</b></span>";
              days = "<span color='#ecc6d9'><b>{}</b></span>";
              weeks = "<span color='#99ffdd'><b>W{}</b></span>";
              weekdays = "<span color='#ffcc66'><b>{}</b></span>";
              today = "<span color='#ff6699'><b><u>{}</u></b></span>";
            };
          };
          actions =  {
            on-click-right = "mode";
            on-click-forward = "tz_up";
            on-click-backward = "tz_down";
            on-scroll-up = "shift_up";
            on-scroll-down = "shift_down";
          };
        };
      };
    };

    style = ''
      * {
        font-family: JetBrainsMono Nerd Font;
        font-size: 12px;
        padding: 0;
      }

      #window {
        padding-left: 10px;
      }

      window#waybar.top {
        background-color: #000;
      }

      window#waybar {
        color: #fff;
      }

      #workspaces {
        margin: 0;
      }

      #workspaces button {
        padding: 0;
        margin: 0;
      }

      #workspaces button.active {
        color: #fff;
      }

      #workspaces button.urgent {
        color: #ff0000;
      }

      #workspaces button:hover {
        color: #fff;
        background-color: #111;
      }

      #custom-logo {
        padding-left: 10px;
        padding-right: 10px;
        color: #7EBAE4;
        font-weight: bold;
      }

      .modules-right {
        padding-right: 10px;
      }

      #idle_inhibitor {
        padding-right: 10px;
      }

      #wireplumber {
        padding-right: 10px;
      }

      #wireplumber.muted {
        color: #ff0000;
      }

      #tray {
        padding-right: 10px;
      }
    '';
  };
}