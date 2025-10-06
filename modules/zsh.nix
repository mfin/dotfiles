{ config, pkgs, ... }:

{
  home.file.".zsh_functions".source = ./zsh/zsh_functions;

  programs.zsh = {
    enable = true;

    autosuggestion = {
      enable = true;
    };

    history = {
      extended = true;
    };

    shellAliases = {
      a = "ansible";
      ap = "ansible-playbook";
      cat = "bat";
      ditch = "assume --unset";
      f = "vim .";
      g = "git";
      h = "helm";
      hm = "home-manager";
      lg = "lazygit";
      k = "kubectl";
      kp = "kube-prompt";
      my_ip = "http -p b http://ipinfo.io/ip";
      n = "nnn -deHiUx";
      nb = "cd $(readlink $(echo $HOME/.config/nnn/bookmarks/$(/bin/ls $HOME/.config/nnn/bookmarks/ | fzf)))";
      t = "task";
      v = "nvim";
    };

    initExtraFirst = builtins.readFile ./zsh/extrafirst.zsh;
    initExtra = builtins.readFile ./zsh/extra.zsh;
  };

  programs.zsh.prezto =  {
    enable = true;
    color = true;
    pmodules = [
      "environment"
      "terminal"
      "editor"
      "history"
      "directory"
      "spectrum"
      "utility"
      "completion"
      "syntax-highlighting"
      "autosuggestions"
      "python"
    ];
    editor.keymap = "emacs";
    editor.dotExpansion = true;

    syntaxHighlighting.highlighters = [ "main" "brackets" "pattern" "line" "cursor" "root" ];

    terminal = {
      autoTitle = true;
      windowTitleFormat = "%s";
      tabTitleFormat = "%m: %s";
      multiplexerTitleFormat = "%s";
    };
    utility.safeOps = true;
  };

  programs.starship.enable = true;
}
