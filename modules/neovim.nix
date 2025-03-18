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
      neo-tree-nvim
      nnn-vim
      fzf-vim
    ];

    extraConfig = builtins.readFile ./neovim/extra.config;
  };
}
