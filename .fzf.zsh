# Setup fzf
# ---------
if [[ ! "$PATH" == */home/jonkel/plugins/fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/jonkel/plugins/fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/jonkel/plugins/fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/jonkel/plugins/fzf/shell/key-bindings.zsh"
