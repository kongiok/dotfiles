# ===== Plugins =====

if  [[ ! -f "$STARFORGE_PARTS_DIR/znap/znap.zsh" ]];then
  log::error "Znap not found at $STARFORGE_PARTS_DIR/znap/znap.zsh"
  return 1
fi

source "$STARFORGE_PARTS_DIR/znap/znap.zsh"

# Suggestions
znap source zsh-users/zsh-autosuggestions

# Completion supports
znap source zsh-users/zsh-completions
autoload -Uz compinit && znap eval _ compinit

# Syntax Highlighting
znap source zsh-users/zsh-syntax-highlighting

# Dev Utils
znap source zsh-users/zsh-history-substring-search
znap source Aloxaf/fzf-tab
