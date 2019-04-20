#
# ~/.profile
#

export EDITOR=vim
export SSH_ASKPASS=/usr/bin/qt4-ssh-askpass
export PATH="$HOME/.go/bin:$HOME/.local/bin:$HOME/.bin:$HOME/.pyenv/bin:$PATH"
export GOPATH=$HOME/.go

export QT_QPA_PLATFORMTHEME=gtk2
export _JAVA_AWT_WM_NONREPARENTING=1

if [ -f $HOME/.env/${HOSTNAME,,}.env ]; then
    eval $(cat $HOME/.env/${HOSTNAME,,}.env)
fi

. /usr/share/LS_COLORS/dircolors.sh
