unsetopt PATH_DIRS

path+=("$HOME/.krew/bin")

# Use Strongbox as SSH agent
export SSH_AUTH_SOCK="$HOME/.strongbox/agent.sock"

# fzf autocomplete
if [ -n "${commands[fzf-share]}" ]; then
    source "$(fzf-share)/key-bindings.zsh"
    source "$(fzf-share)/completion.zsh"
fi

source <(helm completion zsh)
source <(kind completion zsh)

. $HOME/.zsh_functions

if [ -f $HOME/.private/zsh/functions ]; then
    . $HOME/.private/zsh/functions
fi

if [ -f $HOME/.env/$(hostname).env ]; then
    eval $(cat $HOME/.env/$(hostname).env)
fi

# set the default notification backend for noti
export NOTI_DEFAULT="pushover"

eval $(thefuck --alias)
