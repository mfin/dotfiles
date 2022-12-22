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
    ./modules/code.nix
    ./modules/direnv.nix
    ./modules/git.nix
    ./modules/neovim.nix
    ./modules/nnn.nix
    ./modules/packages.nix
    ./modules/wsl.nix
    ./modules/zsh.nix
  ] ++ lib.optional (builtins.pathExists "${homedir}/.private/private.nix") "${homedir}/.private/private.nix";

  programs.home-manager.enable = true;
}
