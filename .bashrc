#
# ~/.bashrc
#

# TODO get aliases from .bash_aliases
alias ls='ls --color=auto'
alias la='ls -la'
alias vct='veracrypt -t'
alias ga='git add -A'
alias gc='git commit -m'
alias gp='git push'

# beautify the prompt (git instegration also)
. ~/.git-prompt.sh
. ~/.bash-prompt.sh

# get gnome-keyring variables
eval $(gnome-keyring-daemon --start) && export SSH_AUTH_SOCK GPG_AGENT_INFO

# force ignoredups and ignorespace
export HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
