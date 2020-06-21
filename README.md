# dotfiles

- Bare Git Repository를 활용한 dotfiles

## 초기 세팅

```
git init --bare $HOME/.dotfiles.git
echo 'alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME"' >> $HOME/.zshrc
source ~/.zshrc
dotfiles config --local status.showUntrackedFiles no
```

## 클론

```
git clone --bare git@github.com:artberryx/dotfiles.git $HOME/.myconf
alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME"
dotfiles checkout
dotfiles config --local status.showUntrackedFiles no
```
