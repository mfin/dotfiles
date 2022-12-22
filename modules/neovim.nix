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
      { plugin = vim-startify;
        config = "let g:startify_change_to_vcs_root = 0";
      }
    ];

    extraConfig = builtins.readFile ./neovim/extra.config;
  };
}
