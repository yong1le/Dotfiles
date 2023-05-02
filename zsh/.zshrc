# Quickly jump to common folders
export UNI="/Users/yonglehe/Documents/Notes/notes/assets/uni/"
export PROJECTS="/Users/yonglehe/Documents/Code/Projects/"
export ASTRO="/Users/yonglehe/.config/nvim/lua/user/"

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

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/yonglehe/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/yonglehe/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/yonglehe/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/yonglehe/Downloads/google-cloud-sdk/completion.zsh.inc'; fi
