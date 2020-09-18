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

# nvim
if [[ -x "$(command -v nvim)" ]]
then
    alias vim="nvim"
    alias vi="nvim"
    alias vimdiff="nvim -d"
    export EDITOR=/usr/local/bin/nvim
    export VISUAL=/usr/local/bin/nvim
else
    export EDITOR=vi
    export VISUAL=vi
fi

# vi mode
bindkey -v
autoload edit-command-line
zle -N edit-command-line
bindkey -M vicmd "^v" edit-command-line

# zsh + fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

