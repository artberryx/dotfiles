# zsh
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="agnoster"
plugins=(
  git
  fzf
  zsh-syntax-highlighting
  zsh-autosuggestions
)

# oh-my-zsh
source $ZSH/oh-my-zsh.sh

# bashrc
source $HOME/.commonrc

# vi mode
bindkey -v
autoload edit-command-line
zle -N edit-command-line
bindkey -M vicmd "^v" edit-command-line

# zsh + fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# scm_breeze
[ -s "/Users/artberryx/.scm_breeze/scm_breeze.sh" ] && source "/Users/artberryx/.scm_breeze/scm_breeze.sh"

# dotfiles
alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME"

