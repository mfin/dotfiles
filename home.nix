{ config, pkgs, ... }:

let
  locale = "en_US.UTF-8";
  homedir = builtins.getEnv "HOME";
  username = builtins.getEnv "USER";
in
{
  home = {
    stateVersion = "22.11";

    username = username;
    homeDirectory = homedir;

    sessionVariables = {
      LANG = locale;
      LC_ALL = locale;
      EDITOR = "vim";
    };
  };

  imports = [
    ./git.nix
    ./other.nix
    ./packages.nix
    ./ranger.nix
    ./vim.nix
    ./zsh.nix
  ];

  programs.home-manager.enable = true;
}
