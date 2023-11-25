export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(git)

. "$HOME/.asdf/asdf.sh"

alias cls="clear"

source $ZSH/oh-my-zsh.sh
source $HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh

