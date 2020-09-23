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

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='fd --hidden --no-ignore --type f'
export FZF_CTRL_T_COMMAND='fd --hidden --no-ignore'
export FZF_ALT_C_COMMAND='fd --hidden --no-ignore --type d'

# zshrc.local
if [[ -f ~/.zshrc.local ]]
then
  source ~/.zshrc.local
fi

# fasd
eval "$(fasd --init auto)"
alias v='f -e nvim'

