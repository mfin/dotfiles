#!/usr/bin/env bash

set -e

curl -L https://nixos.org/nix/install | sh

nix-channel --add https://github.com/rycee/home-manager/archive/master.tar.gz home-manager
nix-channel --update
nix-shell '<home-manager>' -A install

home-manager switch

sudo echo "$HOME/.nix-profile/bin/zsh" >> /etc/shells
chsh -s $HOME/.nix-profile/bin/zsh
