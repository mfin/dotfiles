{ config, pkgs, ... }:

{
  home.file.".zsh_functions".source = ./zsh/zsh_functions;

  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;

    history = {
      extended = true;
    };

    shellAliases = {
      a = "ansible";
      ap = "ansible-playbook";
      av = "aws-vault";
      cat = "bat";
      g = "git";
      h = "helm";
      hm = "home-manager";
      k = "kubectl";
      kp = "kube-prompt";
      l = "exa -l";
      la = "exa -lah";
      ls = "exa";
      my_ip = "http -p b http://ipinfo.io/ip";
      n = "nnn -deHiUx";
      t = "terraform";
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
      "ssh"
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
