# Check if this is an interactive shell, avoid login shell error
[[ $- == *i* ]] || return

source "$CONFIG_HOME/shells/zsh/init.zsh"
