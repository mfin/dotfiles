#
# ~/.bash_profile
#

export EDITOR=vim
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$HOME/.rbenv/bin:$HOME/.bin:$PATH"

eval "$(pyenv init -)"
eval "$(rbenv init -)"
eval "$(dircolors -b $HOME/.dircolors/LS_COLORS)"
