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

## Terminal Fonts

1)Font
Powerlevel10k doesn't require custom fonts but can take advantage of them if they are available. It works well with Nerd Fonts, Source Code Pro, Font Awesome, Powerline, and even the default system fonts. The full choice of style options is available only when using Nerd Fonts.
Recommended font: Meslo Nerd Font patched for Powerlevel10k.
Download these four ttf files:

[MesloLGS NF Regular.ttf](https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf)
[MesloLGS NF Bold.ttf](https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf)
[MesloLGS NF Italic.ttf](https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf)
[MesloLGS NF Bold Italic.ttf](https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf)

## References

https://www.atlassian.com/git/tutorials/dotfiles

https://dev.to/pratik_kale/customise-your-terminal-using-zsh-powerlevel10k-1og5

https://github.com/kalkayan/dotfiles

https://www.youtube.com/watch?v=bTLYiNvRIVI
