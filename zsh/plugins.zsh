# ----- Plugins ----- #
# Plugins directory
export PLUGINS_PLACE=$HOME/.zsh_modules/
# Plugins manager install
if [[ ! -d "$PLUGINS_PLACE/znap" ]]; then
	git clone --depth 1 https://github.com/marlonrichert/zsh-snap.git $PLUGINS_PLACE/znap
fi
# Use plugins manager
source "$PLUGINS_PLACE/znap/znap.zsh"

# Syntax Highlighting but much faster
znap source zdharma-continuum/fast-syntax-highlighting
# Auto Suggestions
znap source zsh-users/zsh-autosuggestions
# Faster Carrot
znap source marlonrichert/zsh-edit
# Auto Change Directory
znap eval zoxide 'zoxide init zsh'
# Prompt theme
znap eval starship 'starship init zsh'

