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
      VISUAL = "nvim";
      EDITOR = "nvim";
    };
  };

  imports = [
    ./modules/atuin.nix
    ./modules/autojump.nix
    ./modules/direnv.nix
    ./modules/fzf.nix
    ./modules/git.nix
    ./modules/gitui.nix
    ./modules/neovim.nix
    ./modules/nnn.nix
    ./modules/packages.nix
    ./modules/wsl.nix
    ./modules/zellij.nix
    ./modules/zsh.nix
  ] ++ lib.optional (builtins.pathExists "${homedir}/.private/private.nix") "${homedir}/.private/private.nix";

  programs.home-manager.enable = true;
}
