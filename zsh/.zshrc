export PATH="$HOME/.local/bin/:$PATH"
export PATH="$HOME/.local/scripts/:$PATH"
export PATH="$HOME/go/bin/:$PATH"
export ANDROID_HOME="/home/yonglehe/Android/sdk"
export PATH="$PATH:$ANDROID_HOME/emulator"
export PATH="$PATH:$ANDROID_HOME/platform-tools"

export PATH="/home/yonglehe/.local/share/fnm:$PATH"
eval "`fnm env`"

if [ -f "/opt/conda/etc/profile.d/conda.sh" ]; then
    . "/opt/conda/etc/profile.d/conda.sh"
else
    export PATH="/opt/conda/bin:$PATH"
fi

# ZSH options (ignore-case)
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'

# Auto-Suggestions and Syntax Highlighting
if [ ! -e ~/.zsh/zsh-syntax-highlighting ]; then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.zsh/zsh-syntax-highlighting
fi
if [ ! -e ~/.zsh/zsh-autosuggestions ]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
fi
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Prompt Config
eval "$(starship init zsh)"
eval "$(zoxide init --cmd cd zsh)"

# Start Tmux, change $TERM_PROGRAM to whichever terminal emulator
if command -v tmux &> /dev/null && \
  ([ "$TERM_PROGRAM" = "WezTerm" ] || [ "$TERM" = "xterm-kitty" ])  && \
  [ -z "$TMUX" ] && [ -n "$PS1" ]; then
    tmux has-session 2> /dev/null
    if [ $? != 0 ]; then
      exec tmux
    else
      exec tmux attach-session
    fi
fi
