export UNI="$HOME/Documents/uni/"
export PROJECTS="$HOME/Documents/Code/Projects/"

export XDG_CONFIG_PATH="$HOME/.config/"

# GNU UTILS
BREW_BIN="/opt/homebrew/bin/brew"
INSTALLED_GNU="coreutils binutils diffutils findutils gnu-tar gnu-which gnu-sed gnu-indent grep gcc"
if type "${BREW_BIN}" &> /dev/null; then
    export BREW_PREFIX="$("${BREW_BIN}" --prefix)"
    for p in $(echo $INSTALLED_GNU | cat); do
        for bindir in "${BREW_PREFIX}/opt/$p/libexec/gnubin"; do export PATH=$bindir:$PATH; done
        for bindir in "${BREW_PREFIX}/opt/$p/bin"; do export PATH=$bindir:$PATH; done
        for mandir in "${BREW_PREFIX}/opt/$p/libexec/gnuman"; do export MANPATH=$mandir:$MANPATH; done
        for mandir in "${BREW_PREFIX}/opt/$p/share/man"; do export MANPATH=$mandir:$MANPATH; done
    done
fi
export PATH="$HOME/.local/bin/:$PATH"


# Aliases
alias python="python3"
alias scl="scp -r $UNI/cscb09 scp://heyong4@mathlab.utsc.utoronto.ca/~/cscb09s23_space"

## Java Stuff
export CPPFLAGS="-I/opt/homebrew/opt/openjdk/include"

# export CLASSPATH="$HOME/junit-platform-console-standalone-1.10.0-M1.jar"


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
