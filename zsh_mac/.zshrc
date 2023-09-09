export UNI="$HOME/Documents/notes/uni/files"
export PROJECTS="$HOME/Documents/Code/Projects/"
export XDG_CONFIG_PATH="$HOME/.config/"
export PATH="$HOME/.local/bin/:$PATH"
export PATH="$HOME/.config/emacs/bin/:$PATH"

# Aliases
alias scl="scp -r $UNI/20235/cscb09 scp://heyong4@mathlab.utsc.utoronto.ca/~/cscb09s23_space"

# Auto-Suggestions
if [ ! -e ~/.zsh/zsh-syntax-highlighting ]; then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.zsh/zsh-syntax-highlighting
fi
if [ ! -e ~/.zsh/zsh-autosuggestions ]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
fi

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# IgnoreCase
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'

# Python Env
eval "$(pyenv init -)"

# Node Env
eval "$(nodenv init -)"

# Prompt
eval "$(starship init zsh)"

