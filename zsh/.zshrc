# Autostart X at Login
if [ -z "${DISPLAY}"  ] && [ "${XDG_VTNR}" -eq 1 ]; then
    exec startx
fi

# Quickly jump to common folders
export UNI="$HOME/Documents/notes/uni/"
export PROJECTS="$HOME/Documents/Code/Projects/"
export ASTRO="$HOME/.config/nvim/lua/user/"

export XDG_CONFIG_PATH="$HOME/.config/"


# PATH
# export PATH="/opt/homebrew/opt/python@3.10/libexec/bin:$PATH"
# export PATH="$HOME/.local/bin/:$PATH"
# export PATH="$HOME/.emacs.d/bin/:$PATH"

# Alias
alias ex="xrandr --output Virtual-1 --mode 1920x1080"
alias int="xrandr --output Virtual-1 --mode 1600x1050"
# alias ls="exa"
# alias cat="bat"
# alias python="python3"
# alias emacs="emacs -nw"

# Prompt
eval "$(starship init zsh)"

# Auto-Suggestions
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# IgnoreCase
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'

spice-vdagent
