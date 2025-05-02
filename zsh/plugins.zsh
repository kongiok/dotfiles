# ----- Plugins ----- #
# Plugins manager install
if [[ ! -d "$FORGEPARTS_DIR/znap" ]]; then
	git clone --depth 1 https://github.com/marlonrichert/zsh-snap.git $FORGEPARTS_DIR/znap
fi
# Use plugins manager
source "$FORGEPARTS_DIR/znap/znap.zsh"

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

