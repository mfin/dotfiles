#
# ~/.bash_aliases
#

alias ls='ls --color=auto --group-directories-first'
alias ll='ls -lh --color=auto --group-directories-first'
alias la='ls -lah --color=auto --group-directories-first'
alias vct='veracrypt -t'
alias ga='git add'
alias gc='git commit -m'
alias gp='git push'
alias todo='vi ~/docs/notes/_TODO.md'
alias visualizer='cava -c green -f 30 -i fifo -s 600 -p /home/mfin/.mpd/mpd.fifo'
alias lyrics='beet lyrics -p $(mpc -f "%artist% %title%" current)'
alias subs='subliminal download -l'
alias ..='cd ..'
alias ...='../..'
alias ....='../../..'
alias grep='grep --color=auto'
alias pac='pacman --color=auto'
alias spac='sudo pacman --color=auto'
alias df='df -h'
alias cp='cp -v'
alias mv='mv -v'
alias rm='rm -v'
alias ln='ln -v'
alias psg='ps -A | grep'
alias e='vim'
alias se='sudo vim'
alias tcopy='tmux show-buffer | xclip -selection clipboard'

# function for font testing
function pchar {
    echo $(printf '%b' "\u$1")
}
