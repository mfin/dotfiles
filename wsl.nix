{ config, pkgs, ... }:

let
  wsl-utils = ".wsl-utils";
in
{
  home.file.wsl2-ssh-pageant = {
    source = pkgs.fetchurl {
      url = "https://github.com/BlackReloaded/wsl2-ssh-pageant/releases/download/v1.4.0/wsl2-ssh-pageant.exe";
      sha256 = "sha256:6f71457f83d3c18f5e90613bb4cba2e501885b812409c4c2f86c02d5dc437b3d";
    }; 
    target = "${wsl-utils}/wsl2-ssh-pageant/wsl2-ssh-pageant.exe";
    executable = true;
  };

  home.file.wsl-notify-send = {
    source = pkgs.fetchzip {
      url = "https://github.com/stuartleeks/wsl-notify-send/releases/download/v0.1.871612270/wsl-notify-send_windows_amd64.zip";
      sha256 = "sha256-ORvJbxkSw9Y3QAK9RCmfB6T3Ef8W0HKoJKDO2gGKQ4A=";
      stripRoot = false;
    }; 
    target = "${wsl-utils}/wsl-notify-send/";
  };
}
