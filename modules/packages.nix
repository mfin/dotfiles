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
    cilium-cli
    docker-client
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
    lima
    locale
    minio-client
    mr
    nodejs
    openssh
    pass
    pinentry_mac
    popeye
    rclone
    restic
    ripgrep
    rsync
    socat
    sops
    stow
    tldr
    tmux
    tree
    unzip
    xdg-utils
    yq-go
    zsh
    zx
  ];
}