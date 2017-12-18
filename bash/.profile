#
# ~/.profile
#

export EDITOR=vim
export PATH="$HOME/.bin:$HOME/.pyenv/bin:$PATH"

eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

eval "$(dircolors -b $HOME/.dircolors)"

export QT_QPA_PLATFORMTHEME=gtk2
export _JAVA_AWT_WM_NONREPARENTING=1
