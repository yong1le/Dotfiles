export UNI="$HOME/Documents/uni/"
export PROJECTS="$HOME/Documents/Code/Projects/"
export ASTRO="$HOME/.config/nvim/lua/user/"

export XDG_CONFIG_PATH="$HOME/.config/"


# PATH
# export PATH="/opt/homebrew/opt/python@3.10/libexec/bin:$PATH"
export PATH="$HOME/.local/bin/:$PATH"
# export PATH="$HOME/.emacs.d/bin/:$PATH"

# alias ls="exa"
alias python="python3"


# Auto-Suggestions
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# IgnoreCase
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'


# Prompt
eval "$(starship init zsh)"
