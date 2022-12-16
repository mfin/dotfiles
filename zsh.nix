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
      my_ip = "http -p b http://ipinfo.io/ip";
      hm = "home-manager";
      k = "kubectl";
      h = "helm";
      t = "terraform";
      g = "git";
      av = "aws-vault";
      kp = "kube-prompt";
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
      # "prompt"
      "syntax-highlighting"
      "autosuggestions"
      "ssh"
      "python"
    ];
    editor.keymap = "emacs";
    editor.dotExpansion = true;
    # prompt.theme = "pure";

    # python.virtualenvInitialize = true;
    # python.virtualenvAutoSwitch = true;

    # ssh.identities = [ "id_rsa" "id_rsa2" "id_github" ];

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