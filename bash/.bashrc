#
# ~/.bashrc
#

# import my aliases
. ~/.bash_aliases

[[ -f "$HOME/.bash_helpers" ]] && source $HOME/.bash_helpers

# [[ -f "$HOME/.sops-age" ]] && source $HOME/.sops-age

# make man pages colorful
man() {
    env LESS_TERMCAP_mb=$'\E[01;31m' \
    LESS_TERMCAP_md=$'\E[01;38;5;74m' \
    LESS_TERMCAP_me=$'\E[0m' \
    LESS_TERMCAP_se=$'\E[0m' \
    LESS_TERMCAP_so=$'\E[38;5;246m' \
    LESS_TERMCAP_ue=$'\E[0m' \
    LESS_TERMCAP_us=$'\E[04;38;5;146m' \
    man "$@"
}

# masquerade as xterm!
export TERM=rxvt-256color

# aws-vault backend
export AWS_VAULT_BACKEND=pass

# some tab completion wizardry
bind "set completion-ignore-case on"
bind "set completion-map-case on"
bind "set show-all-if-ambiguous on"

# 'cd' wizardry
shopt -s autocd
shopt -s dirspell
shopt -s cdspell

# start the gpg-agent if not already running
if ! pgrep -x -u "${USER}" gpg-agent >/dev/null 2>&1; then
  gpg-connect-agent /bye >/dev/null 2>&1
fi

# set SSH to use gpg-agent
unset SSH_AGENT_PID
if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
  export SSH_AUTH_SOCK="/run/user/$UID/gnupg/S.gpg-agent.ssh"
fi

# set GPG TTY
export GPG_TTY=$(tty)

# refresh gpg-agent tty in case user switches into an X session
gpg-connect-agent updatestartuptty /bye >/dev/null

# append to the history file, don't overwrite it
shopt -s histappend

# save multi-line commands as one command
shopt -s cmdhist

# huge history. doesn't appear to slow things down, so why not?
HISTSIZE=500000
HISTFILESIZE=100000

# avoid duplicate entries
HISTCONTROL="erasedups:ignoreboth"

# don't record some commands
export HISTIGNORE="&:[ ]*:exit:ls:bg:fg:history"

# useful timestamp format
HISTTIMEFORMAT='%F %T '

alias_completion(){
    # keep global namespace clean
    local cmd completion

    # determine first word of alias definition
    # NOTE: This is really dirty. Is it possible to use
    #       readline's shell-expand-line or alias-expand-line?
    cmd=$(alias "$1" | sed 's/^alias .*='\''//;s/\( .\+\|'\''\)//')

    # determine completion function
    completion=$(complete -p "$1" 2>/dev/null)

    # run _completion_loader only if necessary
    [[ -n $completion ]] || {

        # load completion
        _completion_loader "$cmd"

        # detect completion
        completion=$(complete -p "$cmd" 2>/dev/null)
    }

    # ensure completion was detected
    [[ -n $completion ]] || return 1

    # configure completion
    eval "$(sed "s/$cmd\$/$1/" <<<"$completion")"
}

# aliases to load completion for
aliases=(d g k dc s h t)

for a in "${aliases[@]}"; do
    alias_completion "$a"
done

# clean up after ourselves
unset a aliases

eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

eval "$(direnv hook bash)"

eval "$(starship init bash)"
