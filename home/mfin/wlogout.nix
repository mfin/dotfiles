{ config, pkgs, ... }:

{
  programs.wlogout = {
    enable = true;

    layout = [
      {
        label = "shutdown";
        action = "systemctl poweroff";
        keybind = "s";
        text = "Shutdown";
      }
      {
        label = "reboot";
        action = "systemctl reboot";
        keybind = "r";
        text = "Reboot";
      }
    ];
  };
}
