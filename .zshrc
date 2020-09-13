# zsh
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="agnoster"
plugins=(
  git
  fzf
  zsh-autosuggestions
  zsh-syntax-highlighting
)

# oh-my-zsh
source $ZSH/oh-my-zsh.sh

# commonrc
source $HOME/.commonrc

# vi mode
bindkey -v
autoload edit-command-line
zle -N edit-command-line
bindkey -M vicmd "^v" edit-command-line

# zsh + fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

