{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    ansible
    ansible-lint
    argocd
    autorestic
    aws-vault
    awscli
    bash
    bat
    fd
    fzf
    gnumake
    go-task
    grc
    grpcurl
    htop
    httpie
    jq
    k9s
    kind
    krew
    kube-prompt
    kubeconform
    kubectl
    kubectx
    kubernetes-helm
    locale
    minio-client
    nodejs
    ntfy
    pass
    popeye
    qmk
    rclone
    restic
    ripgrep
    rsync
    socat
    sops
    stow
    tldr
    tmux
    unzip
    wsl-open
    wslu
    xdg-utils
    yq-go
    zsh
    zx
  ];
}
