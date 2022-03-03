# Quickly jump to common folders
export PROJECTS="/Users/yonglehe/Documents/Code/Projects"
export TRIVIAL="/Users/yonglehe/Documents/Code/Trivial"
export XDG_CONFIG_PATH="/Users/yonglehe/.config/"
export NEOVIDE_MULTIGRID=1
export NEOVIDE_FRAMELESS=1

# PATH
export PATH="$HOME/.local/bin/:$PATH"
export PATH="$HOME/.emacs.d/bin/:$PATH"

# Alias
alias ls="exa"
alias cat="bat"
alias python="python3"
alias emacs="emacs -nw"

# Prompt
eval "$(starship init zsh)"

# Auto-Suggestions
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# IgnoreCase
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
