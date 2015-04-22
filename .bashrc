#
# ~/.bashrc
#

alias ls='ls --color=auto'
alias la='ls -la'
alias vct='veracrypt -t'

. ~/.git-prompt.sh
. ~/.bash-prompt.sh

eval $(gnome-keyring-daemon --start) && export SSH_AUTH_SOCK GPG_AGENT_INFO

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
