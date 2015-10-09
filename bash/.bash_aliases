#
# ~/.bash_aliases
#

alias ls='ls --color=auto --group-directories-first'
alias ll='ls -l -h --color=auto --group-directories-first'
alias la='ls -lha --color=auto --group-directories-first'
alias vct='veracrypt -t'
alias ga='git add -A'
alias gc='git commit -m'
alias gp='git push'
alias todo='vi ~/docs/notes/_TODO.md'
alias visualizer='cava -c green -f 30 -i fifo -s 200 -p /home/mfin/.mpd/mpd.fifo'
alias lyrics='beet lyrics -p $(mpc -f "%artist% %title%" current)'
