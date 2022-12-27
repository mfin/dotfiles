<div align=center>

# dotfiles 💻
#### _my WSL userspace environment managed with Home Manager 🐧🪟_

<img src=screenshot.png width=300px>
</div>

## Intro
My personal declarative development environment setup with [home-manager](https://github.com/nix-community/home-manager) (NixOS) on Ubuntu WSL2. Some dependencies exist on the host (Windows) side, such as Kleopatra for SSH/PGP.

## Use configuration
Check the `install.sh` script. It's not yet runnable, but should give some pointers on the dependencies.

```bash
git clone https://github.com/mfin/dotfiles .config/nixpkgs 
home-manager switch
```
This setup also optionally pulls in private configuration from `$HOME/.private/private.nix`, if it exists. Useful for storing somewhat secret workspace configuration.

## TODO
- document host-side dependencies
- document modules used in the configuration
- iron out the nvim configuration
- make install.sh runnable
