{ config, pkgs, lib, ... }:

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
      VISUAL = "vim";
      EDITOR = "vim";
    };
  };

  imports = [
    ./code.nix
    ./direnv.nix
    ./git.nix
    ./nnn.nix
    ./packages.nix
    ./vim.nix
    ./zsh.nix
    ./wsl.nix
  ] ++ lib.optional (builtins.pathExists "${homedir}/.private/private.nix") "${homedir}/.private/private.nix";

  programs.home-manager.enable = true;
}
