#
# ~/.profile
#

export EDITOR=vim
export SSH_ASKPASS=/usr/bin/qt4-ssh-askpass
export PATH="$HOME/.local/bin:$HOME/.bin:$HOME/.pyenv/bin:$PATH"

export QT_QPA_PLATFORMTHEME=gtk2
export _JAVA_AWT_WM_NONREPARENTING=1

if [ -f $HOME/.env/${HOSTNAME,,}.env ]; then
    eval $(cat $HOME/.env/${HOSTANAME,,}.env)
fi

. /usr/share/LS_COLORS/dircolors.sh
