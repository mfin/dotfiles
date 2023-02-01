<div align=center>

# dotfiles 💻
#### _my WSL userspace environment managed with Home Manager 🐧🪟_

<img src=screenshot.png width=300px>
</div>

## Intro
My personal declarative development environment setup with [home-manager](https://github.com/nix-community/home-manager) (NixOS) on Ubuntu WSL2. Some dependencies exist on the host (Windows) side, such as Kleopatra for SSH/PGP.

## Installation
Installation is done with the help of [Task](https://taskfile.dev/). To install Task and provision the environment, run the script below in the repository root. If using anything else than Ubuntu, you'll have to install Task according to [official documentation](https://taskfile.dev/installation/).
```bash
export TMP_DEB=$(mktemp)
wget -O $TMP_DEB https://github.com/go-task/task/releases/download/v3.20.0/task_linux_amd64.deb
sudo dpkg -i $TMP_DEB
sudo rm -rf $TMP_DEB

task bootstrap
```
Once `task bootstrap` is done, open a new shell and your environment should be ready to go. Some maintenance tasks are also included, check [Taskfile.yaml](Taskfile.yaml) for all the available options.

This setup also optionally pulls in private configuration from `$HOME/.private/private.nix`, if it exists. Useful for storing somewhat secret workspace configuration.

## TODO
- document host-side dependencies
- document modules used in the configuration
- iron out the nvim configuration
