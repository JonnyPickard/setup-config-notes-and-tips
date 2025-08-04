# Stripped down .zshrc additions when setting up a new machine

ZSH_THEME="lambda-mod"

export ZSH="/Users/jonnyp/.oh-my-zsh"

export NVM_AUTO_USE=true

plugins=(
  autojump
  zsh-autosuggestions
  zsh-syntax-highlighting
  zsh-nvm
)

source $ZSH/oh-my-zsh.sh
