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

# Prompt
eval "$(starship init zsh)"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/yongle/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/yongle/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/yongle/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/yongle/google-cloud-sdk/completion.zsh.inc'; fi
