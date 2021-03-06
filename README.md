# dotfiles
Dotfiles for zsh

## Setup for new computer

```zsh
echo ".dotfiles" >> .gitignore
git clone --bare git@github.com:jonaskello/dotfiles-zsh.git $HOME/.dotfiles
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
dotfiles config --local status.showUntrackedFiles no
dotfiles checkout
```

## Edit dotfiles

Use regular git commands with `dotfiles` instead of `git`. For example:

```zsh
dotfiles add .myconfig
dotfiles commit -m "Add myconfig"
dotfiles push
```

To update with the changes on antoher computer do:

```zsh
dotfiles pull
```

## First time setup (only when creating the repo, not needed for new computers)

```zsh
git init --bare $HOME/.dotfiles
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
dotfiles config --local status.showUntrackedFiles no
echo "alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'" >> $HOME/.bashrc
```

## References

https://www.atlassian.com/git/tutorials/dotfiles

https://dev.to/pratik_kale/customise-your-terminal-using-zsh-powerlevel10k-1og5

https://github.com/kalkayan/dotfiles

https://www.youtube.com/watch?v=bTLYiNvRIVI
