{ config, pkgs, ... }:

{
  programs.neovim = {
    enable = true;

    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    plugins = with pkgs.vimPlugins; [
      vim-gitgutter
      vim-fugitive
      nnn-vim
      fzf-vim
    ];

    extraConfig = builtins.readFile ./neovim/extra.config;
  };
}
