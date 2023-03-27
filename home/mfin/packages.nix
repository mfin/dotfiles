{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    ansible
    ansible-lint
    ardour
    argocd
    audacity
    autorestic
    aws-vault
    awscli
    bash
    bat
    cfonts
    cliphist
    darktable
    delta
    direnv
    discord-canary
    exa
    fd
    firefox
    fzf
    gh
    gimp
    git
    gnumake
    gnupg
    go-task
    google-chrome
    gpicview
    grc
    grim
    grpcurl
    htop
    httpie
    jo
    jq
    k9s
    kalker
    kind
    krew
    kube-prompt
    kubeconform
    kubectl
    kubectx
    kubernetes-helm
    libreoffice-fresh
    locale
    minio-client
    mpv
    nodejs
    ntfy
    obsidian
    ouch
    pass
    pavucontrol
    plexamp
    popeye
    pulsemixer
    qmk
    qpwgraph
    rclone
    restic
    ripgrep
    rsync
    slack
    slurp
    socat
    sops
    spotify
    starship
    stow
    swayidle
    swaylock-effects
    swww
    synology-drive-client
    thunderbird
    tldr
    tmux
    unzip
    virt-manager
    vscode
    wev
    wf-recorder
    wl-clipboard
    wofi
    wsl-open
    wslu
    xdg-user-dirs
    xdg-utils
    xfce.thunar
    xfce.thunar-archive-plugin
    xfce.thunar-volman
    xfce.tumbler
    yq-go
    zathura
    zoom-us
    zx
  ];
}
