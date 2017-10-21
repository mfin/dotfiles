#
# ~/.bashrc
#

# import my aliases
. ~/.bash_aliases

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
export TERM=xterm

# better prompt
source $HOME/.bash_prompt

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

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
