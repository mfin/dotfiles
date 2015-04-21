#
# ~/.bashrc
#

alias ls='ls --color=auto'
alias la='ls -la'
alias vct='veracrypt -t'

. ~/.git-prompt.sh
. ~/.bash-prompt.sh

if [ -f "${HOME}/.gpg-agent-info" ]; then
  . "${HOME}/.gpg-agent-info"
  export GPG_AGENT_INFO
  export SSH_AUTH_SOCK
fi

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
