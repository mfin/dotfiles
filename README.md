<div align="center">

# dotfiles 💻
#### _macOS  userspace managed with Home Manager and Nix_

<img src="screenshot.png" width="300px">
</div>

## Intro
This repository contains my personal, declarative dotfiles managed with Nix and [home-manager](https://github.com/nix-community/home-manager). It is tailored for macOS  as the primary host environment.

The setup is split between purely declarative Nix/Home Manager settings (this repo) and a small set of host-side dependencies and helpers that must be installed on macOS (listed below).

## Prerequisites

- Homebrew (brew): used to install host-side packages and GUI apps not managed by Nix. Install from https://brew.sh/ and use it for any macOS-specific installers you prefer.
- yabai + skhd: tiling window management and hotkeys on macOS, install `yabai` and `skhd` via Homebrew (or your preferred method) and follow their macOS setup steps (codesigning, Accessibility & Input Monitoring permissions). 

## Installation / Bootstrap

This repository includes a `Taskfile.yaml` with helper tasks for bootstrapping and maintenance. Typical steps to get started:

2. Download Task. I usually just download the binary from a Github Release and make it executable. Task gets properly installed after bootstrap with Home Manager.

```bash
curl -sLO https://github.com/go-task/task/releases/download/v3.45.4/task_darwin_arm64.tar.gz
tar -xzf task_darwin_arm64.tar.gz task
chmod +x task
```

3. From the repo root, run the bootstrap task which wires home-manager into your user environment and installs declared packages:
```bash
./task bootstrap
```

4. Open a new terminal (or re-source your shell profile) and verify your environment. After this, you can use `task` as part of your environment.

## Modules included

See `home.nix` for the exact imports. Some modules have extra host-side notes (for example `yabai` and `skhd` require macOS-specific setup). There are also nested directories for module-specific configuration like `modules/neovim/` and `modules/nnn/plugins/`.

## Private configuration

This setup will include optional private overrides from `$HOME/.private/private.nix` if it exists. Use that file to keep secrets or machine-specific settings out of version control.

## Tips & Troubleshooting

- yabai/skhd permissions: after installing the binaries, codesign them if necessary and grant Accessibility & Input Monitoring in System Settings > Privacy & Security.
- SSH integration: I use Strongbox as my password manager and use their agent for SSH keys.
- macOS shell login vs GUI apps: GUI apps launched by macOS (like Terminal/iTerm) may not inherit the same environment as shells run through Nix. If something looks missing, open a login shell or source your home-manager generated profile.

## License

This repository is available under the license in `LICENSE`.
