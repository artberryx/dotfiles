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
git clone --bare git@github.com:artberryx/dotfiles.git $HOME/.dotfiles.git
alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME"
dotfiles checkout
dotfiles config --local status.showUntrackedFiles no
```

## References

- [Bare Git Repository 사용해서 설정파일 관리하기](https://harfangk.github.io/2016/09/18/manage-dotfiles-with-a-git-bare-repository-ko.html)
- [dotfile을 편하게 관리하는 방법(with Bare Git repository)](https://velog.io/@wannte/dotfile%EC%9D%84-%ED%8E%B8%ED%95%98%EA%B2%8C-%EA%B4%80%EB%A6%AC%ED%95%98%EB%8A%94-%EB%B0%A9%EB%B2%95with-Bare-Git-repository)
