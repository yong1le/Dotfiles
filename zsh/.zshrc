# Quickly jump to common folders
export PROJECTS="/Users/yonglehe/Documents/Code/Projects"
export TRIVIAL="/Users/yonglehe/Documents/Code/Trivial"

# Alias
alias ls="exa"
alias cat="bat"
alias python="python3"

# Prompt
eval "$(starship init zsh)"

# Auto-Suggestions
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# IgnoreCase
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
