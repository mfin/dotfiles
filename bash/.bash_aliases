#
# ~/.bash_aliases
#

alias ls='ls --color=auto --group-directories-first'
alias ll='ls -lh --color=auto --group-directories-first'
alias la='ls -lah --color=auto --group-directories-first'
alias vct='veracrypt -t'
alias ga='git add'
alias gc='git commit -S -m'
alias gp='git push'
alias todo='vi ~/docs/notes/_TODO.md'
alias visualizer='cava -c green -f 30 -i fifo -s 600 -p /home/mfin/.mpd/mpd.fifo'
alias lyrics='beet lyrics -p $(mpc -f "%artist% %title%" current)'
alias subs='subliminal download -l'
alias val202='mpv http://mp3.rtvslo.si:80/val202'
alias ..='cd ..'
alias ...='../..'
alias ....='../../..'
alias grep='grep --color=auto'
alias df='df -h'
alias cp='cp -v'
alias mv='mv -v'
alias rm='rm -v'
alias ln='ln -v'
alias psg='ps -A | grep'
alias tcopy='tmux show-buffer | xclip -selection clipboard'

# function for font testing
function pchar {
    echo $(printf '%b' "\u$1")
}

# convert an image into a blurry one
function blur_image {
    convert $1 -channel RGBA -blur 0x10 blur-$1
    echo "converted $1 successfully"
}

# display weather for city
function wttr {
    curl http://wttr.in/"$1$2$3"?m
}
