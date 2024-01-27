# PATH
export PATH="$HOME/.local/bin/:$PATH"
export PATH="$HOME/.local/scripts/:$PATH"
export PATH="$HOME/go/bin/:$PATH"

# Env Configuration
export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"

if which pyenv > /dev/null; then
  eval "$(pyenv init - zsh --no-rehash)"
fi

if which rbenv > /dev/null; then
eval "$(rbenv init - zsh)"
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

# Start Tmux, change $TERM_PROGRAM to whichever terminal emulator
if command -v tmux &> /dev/null && \
  ([ "$TERM_PROGRAM" = "WezTerm" ] || [ "$TERM_PROGRAM" = "alacritty" ])  && \
  [ -z "$TMUX" ] && [ -n "$PS1" ]; then
    tmux has-session 2> /dev/null
    if [ $? != 0 ]; then
      exec tmux
    else
      exec tmux attach-session
    fi
fi
