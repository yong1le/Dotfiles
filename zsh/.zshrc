# Quickly jump to common folders
export PROJECTS="/Users/yonglehe/Documents/Code/Projects"
export UNI="/Users/yonglehe/Documents/Uni"

export XDG_CONFIG_PATH="/Users/yonglehe/.config/"

# PATH
export PATH="/opt/homebrew/opt/python@3.10/libexec/bin:$PATH"
export PATH="$HOME/.local/bin/:$PATH"
export PATH="$HOME/.emacs.d/bin/:$PATH"

# Alias
alias ls="exa"
alias cat="bat"
# alias python="python3"
alias emacs="emacs -nw"

# Prompt
eval "$(starship init zsh)"

# Auto-Suggestions
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# IgnoreCase
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
