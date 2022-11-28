# Quickly jump to common folders
export PROJECTS="/Users/yonglehe/Documents/Code/Projects"
export TRIVIAL="/Users/yonglehe/Documents/Code/Trivial"
export XDG_CONFIG_PATH="/Users/yonglehe/.config/"

# PATH
export PATH="$HOME/.local/bin/:$PATH"
export PATH="$HOME/.emacs.d/bin/:$PATH"

# Alias
alias ls="exa"
alias cat="bat"
alias python="python3"
alias emacs="emacs -nw"
alias gp="cd ~/Documents/Note_Vault/ && git pull"
alias gc="cd ~/Documents/Note_Vault/ && git add -A && git commit -m 'mac upload' && git push"

# Prompt
eval "$(starship init zsh)"

# Auto-Suggestions
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# IgnoreCase
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
