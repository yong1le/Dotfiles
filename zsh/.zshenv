export PATH="$HOME/.local/bin/:$PATH"
export PATH="$HOME/.local/scripts/:$PATH"
export PATH="$HOME/go/bin/:$PATH"
export PATH="$HOME/.cargo/bin/:$PATH"
export ANDROID_HOME="/home/yonglehe/Android/sdk"
export PATH="$PATH:$ANDROID_HOME/emulator"
export PATH="$PATH:$ANDROID_HOME/platform-tools"

FNM_PATH="/home/yonglehe/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="/home/yonglehe/.local/share/fnm:$PATH"
  eval "`fnm env`"
fi

if [ -f "/opt/conda/etc/profile.d/conda.sh" ]; then
    . "/opt/conda/etc/profile.d/conda.sh"
else
    export PATH="/opt/conda/bin:$PATH"
fi
. "$HOME/.cargo/env"

# pnpm
export PNPM_HOME="/home/yonglehe/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
