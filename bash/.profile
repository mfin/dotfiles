#
# ~/.profile
#

#export PANEL_FIFO=/tmp/panel-fifo
export EDITOR=vim
#export GOPATH="$HOME/.go"
#export PYENV_ROOT="$HOME/.pyenv"
export PATH="$(cope_path):$PYENV_ROOT/bin:$HOME/.rbenv/bin:$HOME/.go/bin:$HOME/.bin:$PATH"

# eval "$(pyenv init -)"
# eval "$(rbenv init -)"
eval "$(dircolors -b)"
# eval "$(thefuck --alias)"

#[[ -s "/home/mfin/.gvm/scripts/gvm" ]] && source "/home/mfin/.gvm/scripts/gvm"

export QT_STYLE_OVERRIDE=gtk
