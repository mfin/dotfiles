#
# ~/.bashrc
#

. ~/.bash_aliases

# send pass copied passwords to primary
export PASSWORD_STORE_X_SELECTION=primary

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

# beaufify the prompt (with git)
. /usr/share/git/completion/git-prompt.sh

GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWSTASHSTATE=1
GIT_PS1_SHOWUNTRACKEDFILES=1
GIT_PS1_SHOWCOLORHINTS=1
GIT_PS1_DESCRIBE_STYLE="branch"
GIT_PS1_SHOWUPSTREAM="auto git"

get_sha() {
	git rev-parse --short HEAD 2>/dev/null
}

PROMPT_COMMAND='__git_ps1 "\[\033[1;36m\]\u\[\033[0m\] \[\033[0;33m\]\W\[\033[0m\]" " \[\e[31;1m\]> \[\e[0m\]" " \[\033[1;36m\]:\[\033[0m\]%s \[\033[0;35m\]$(get_sha)"'

# get gnome-keyring variables
eval $(gnome-keyring-daemon --start) && export SSH_AUTH_SOCK GPG_AGENT_INFO

# force ignoredups and ignorespace
export HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
