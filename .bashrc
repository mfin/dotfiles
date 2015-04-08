#
# ~/.bashrc
#

export PATH="$HOME/.bin:$PATH"

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

alias vct="veracrypt -t"
