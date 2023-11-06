export UNI="$HOME/Documents/notes/uni/files"
export PROJECTS="$HOME/Documents/Code/Projects/"
export XDG_CONFIG_PATH="$HOME/.config/"
export PATH="$HOME/.local/bin/:$PATH"
export PATH="$HOME/.config/emacs/bin/:$PATH"
export PATH="$HOME/go/bin/:$PATH"

# Python Env
if which pyenv > /dev/null; then
  eval "$(pyenv init - zsh --no-rehash)"
fi

# Node Env
if which nodenv > /dev/null; then
  eval "$(nodenv init - zsh --no-rehash)"
fi
