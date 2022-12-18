path+=("$HOME/.bin")

export WSL2_SSH_PAGEANT=$HOME/.wsl-utils/wsl2-ssh-pageant/wsl2-ssh-pageant.exe
export SSH_AUTH_SOCK="$HOME/.ssh/agent.sock"
export GPG_AGENT_SOCK="$HOME/.gnupg/S.gpg-agent"

gpg_config_basepath=$(gpgconf.exe --list-dirs | grep socketdir | cut -f2- -d: | tr -d '\r\n')
gpg_config_basepath=${gpg_config_basepath//\\/\/}
export WINDOWS_CONFIG=${gpg_config_basepath/\%3a/\\\:}

if ! ss -a | grep -q "$SSH_AUTH_SOCK"; then
    rm -f "$SSH_AUTH_SOCK"
    if test -x "$WSL2_SSH_PAGEANT"; then
        (setsid nohup socat UNIX-LISTEN:"$SSH_AUTH_SOCK,fork" EXEC:"$WSL2_SSH_PAGEANT" >/dev/null 2>&1 &)
    else
        echo >&2 "WARNING: $WSL2_SSH_PAGEANT is not executable."
    fi
fi

if ! ss -a | grep -q "$GPG_AGENT_SOCK"; then
    rm -rf "$GPG_AGENT_SOCK"
    if test -x "$WSL2_SSH_PAGEANT"; then
        (setsid nohup socat UNIX-LISTEN:"$GPG_AGENT_SOCK,fork" EXEC:"$WSL2_SSH_PAGEANT --gpgConfigBasepath $WINDOWS_CONFIG --gpg S.gpg-agent" >/dev/null 2>&1 &)
    else
        echo >&2 "WARNING: $WSL2_SSH_PAGEANT is not executable."
    fi
fi

unset WSL2_SSH_PAGEANT
unset WINDOWS_CONFIG

# fzf autocomplete
if [ -n "${commands[fzf-share]}" ]; then
    source "$(fzf-share)/key-bindings.zsh"
    source "$(fzf-share)/completion.zsh"
fi

source <(helm completion zsh)
source <(kind completion zsh)
eval "$(aws-vault --completion-script-zsh)"

if (( $+WSL_DISTRO_NAME )); then
    # WSL-specific aliases
    alias copy=clip.exe
fi

. $HOME/.zsh_functions

if [ -f $HOME/.env/${HOSTNAME:l}.env ]; then
    eval $(cat $HOME/.env/${HOSTNAME:l}.env)
fi
