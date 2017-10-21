#
# ~/.bash_aliases
#

alias l='ls -a'
alias ls='ls --color=auto --group-directories-first'
alias ll='ls -lah --color=auto --group-directories-first'
alias la='ls -lh --color=auto --group-directories-first'
alias vct='veracrypt -t'
alias ga='git add'
alias gc='git commit -S -m'
alias gp='git push'
alias todo='vim ~/Dropbox/Documents/Notes/_TODO.md'
alias fuck='sudo $(history -p \!\!)'
alias my_ip='wget http://ipinfo.io/ip -qO -'
alias visualizer='cava -c green -f 30 -i fifo -s 600 -p /home/mfin/.mpd/mpd.fifo'
alias lyrics='beet lyrics -p $(mpc -f "%artist% %title%" current)'
alias subs='subliminal download -l'
alias radio_val='mpv http://mp3.rtvslo.si:80/val202'
alias radio_rock='mpv http://stream.rockradio.si:9034'
alias radio_rt='mpv http://live.radioterminal.si/'
alias radio_salomon='mpv http://stream.radiosalomon.si/Salomon'
alias radio_dancenow='mpv http://stream.radiosalomon.si/SalomonDanceNow'
alias updmir='sudo reflector --latest 20 --protocol https --sort rate --save /etc/pacman.d/mirrorlist'
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

# upload files with transfer.sh
transfer() { if [ $# -eq 0 ]; then echo "No arguments specified. Usage:\necho transfer /tmp/test.md\ncat /tmp/test.md | transfer test.md"; return 1; fi
tmpfile=$( mktemp -t transferXXX ); if tty -s; then basefile=$(basename "$1" | sed -e 's/[^a-zA-Z0-9._-]/-/g'); curl --progress-bar --upload-file "$1" "https://transfer.sh/$basefile" >> $tmpfile; else curl --progress-bar --upload-file "-" "https://transfer.sh/$1" >> $tmpfile ; fi; cat $tmpfile; rm -f $tmpfile; }
