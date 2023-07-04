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

Recommended font: Meslo Nerd Font patched for Powerlevel10k.
Download these four ttf files:

- [MesloLGS NF Regular.ttf](https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf)
- [MesloLGS NF Bold.ttf](https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf)
- [MesloLGS NF Italic.ttf](https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf)
- [MesloLGS NF Bold Italic.ttf](https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf)

Double-click on each file and click "Install". This will make MesloLGS NF font available to all applications on your system. Configure your terminal to use this font:

- GNOME Terminal (the default Ubuntu terminal): Open Terminal → Preferences and click on the selected profile under Profiles. Check Custom font under Text Appearance and select MesloLGS NF Regular.
- Apple Terminal: Open Terminal → Preferences → Profiles → Text, click Change under Font and select MesloLGS NF family.
- Microsoft Terminal: Open Settings (Ctrl+,), search for fontFace and set value to MesloLGS NF for every profile. If you are using any other terminal click here for the configuration.

## References

https://www.atlassian.com/git/tutorials/dotfiles

https://dev.to/pratik_kale/customise-your-terminal-using-zsh-powerlevel10k-1og5

https://github.com/kalkayan/dotfiles

https://www.youtube.com/watch?v=bTLYiNvRIVI
