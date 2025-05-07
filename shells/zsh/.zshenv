[[ ! -n "$ZSH_VERSION" ]] && return
export CONFIG_HOME="$HOME/40-Configs"
export ZDOTDIR="$CONFIG_HOME/shells/zsh"
# make sure that zshrc would be login
[[ -f "$CONFIG_HOME/shells/zsh/.zshrc" ]] && source "$CONFIG_HOME/shells/zsh/.zshrc"
