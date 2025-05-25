export PATH="$HOME/.local/bin/:$PATH"
export PATH="$HOME/.local/scripts/:$PATH"
export PATH="$HOME/go/bin/:$PATH"
export PATH="$HOME/racket/bin:$PATH"
export PATH="$HOME/.cabal/bin:$PATH"
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
