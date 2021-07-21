# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If we don't set path explicitly then the windows PATH is added and zsh becomes slow
# https://github.com/microsoft/WSL/issues/4256#issuecomment-586798255
export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"
# Add back path to vscode: https://github.com/microsoft/WSL/issues/4256#issuecomment-665941352
export PATH='/mnt/c/Users/jonas/AppData/Local/Programs/Microsoft VS Code/bin':$PATH


# some useful options (man zshoptions)
setopt autocd extendedglob nomatch menucomplete
setopt interactive_comments
zle_highlight=('paste:none')

# History
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

# beeping is annoying
unsetopt BEEP

# completions
autoload -Uz compinit
zstyle ':completion:*' menu yes select
# zstyle ':completion::complete:lsof:*' menu yes select
#zmodload zsh/complist
compinit
#_comp_options+=(globdots)		# Include hidden files.

# Key bindings
bindkey -e
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
# start typing + [Up-Arrow] - fuzzy find history forward
if [[ "${terminfo[kcuu1]}" != "" ]]; then
    autoload -U up-line-or-beginning-search
    zle -N up-line-or-beginning-search
    bindkey "${terminfo[kcuu1]}" up-line-or-beginning-search
fi
# start typing + [Down-Arrow] - fuzzy find history backward
if [[ "${terminfo[kcud1]}" != "" ]]; then
    autoload -U down-line-or-beginning-search
    zle -N down-line-or-beginning-search
    bindkey "${terminfo[kcud1]}" down-line-or-beginning-search
fi

# Functions for loading plugins and completions
export ZDOTDIR=$HOME
source "$ZDOTDIR/.zsh-functions"

# Plugins
zsh_add_plugin "zsh-users/zsh-syntax-highlighting"
zsh_add_plugin "zsh-users/zsh-autosuggestions"
zsh_add_plugin "romkatv/powerlevel10k" ; source ~/plugins/powerlevel10k/powerlevel10k.zsh-theme ; [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
zsh_add_plugin "junegunn/fzf" ; [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh ; [[ ! -f ~/plugins/fzf/bin/fzf ]] && ~/plugins/fzf/install

# nvm config
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Alias for kubectl
alias k=kubectl
# Alias for maintaining dotfiles in bare git repo
alias dotfiles='/usr/bin/git --git-dir=/home/jonkel/.dotfiles/ --work-tree=/home/jonkel'
# kubectl autocompletion
source <(kubectl completion zsh)
if command -V kubectl-use >/dev/null; then
  source <(kubectl-use -completion)
fi
# flux autocompletion
command -v flux >/dev/null && . <(flux completion zsh) && compdef _flux flux
# Kubernetes configs
export KUBECONFIG=~/.kube/config:/mnt/c/Users/jonkel/Downloads/k8s-promaster-kubeconfig.yaml:~/code/github/jonaskello/k8s-kello/kube_config_cluster.yml:~/code/gitlab.divid.se/divid-it/k8s-divid/kube_config_cluster.yml:~/.kube/swegon-jonas-kello-divid-config:~/.kube/k8s-munters.yaml
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
