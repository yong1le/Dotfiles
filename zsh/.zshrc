export PATH="$HOME/.local/bin/:$PATH"
export PATH="$HOME/.local/scripts/:$PATH"
export PATH="$HOME/go/bin/:$PATH"
export PATH="$HOME/zig:$PATH"

FNM_PATH="$HOME/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="${HOME}/.local/share/fnm:$PATH"
  eval "`fnm env`"
fi

. "$HOME/.cargo/env"

# pnpm
export PNPM_HOME="/home/yonglehe/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

export MANPAGER='nvim +Man!'
export EDITOR="nvim"

fpath=(~/.zfunc $fpath)

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# (saving history)
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000
setopt histignorealldups sharehistory

autoload -Uz compinit
compinit

alias zed="flatpak run dev.zed.Zed"

# Auto-Suggestions and Syntax Highlighting
if [ ! -e ~/.zsh/fsh ]; then
    git clone https://github.com/zdharma-continuum/fast-syntax-highlighting ~/.zsh/fsh
fi
if [ ! -e ~/.zsh/zsh-autosuggestions ]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
fi
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/fsh/fast-syntax-highlighting.plugin.zsh

# Prompt Config
eval "$(starship init zsh)"
eval "$(zoxide init --cmd cd zsh)"
