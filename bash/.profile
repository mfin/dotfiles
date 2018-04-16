#
# ~/.profile
#

export EDITOR=vim
export SSH_ASKPASS=/usr/bin/qt4-ssh-askpass
export PATH="$HOME/.local/bin:$HOME/.bin:$HOME/.pyenv/bin:$PATH"

eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

eval "$(dircolors -b $HOME/.dircolors)"

export QT_QPA_PLATFORMTHEME=gtk2
export _JAVA_AWT_WM_NONREPARENTING=1
