#
# ~/.bashrc
#

alias ls='ls --color=auto'
alias la='ls -la'
alias vct='veracrypt -t'


# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1="\[\e[36;1m\]\u \[\e[32;1m\]\W \[\e[31;1m\]> \[\e[0m\]"
