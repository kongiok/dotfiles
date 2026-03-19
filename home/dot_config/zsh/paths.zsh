path=(
  "$HOME/.cargo/bin" # Cargo bin
  "$HOME/.local/bin" # Local bin (XDG Standard)
  "$HOME/.lmstudio/bin" # LMStudio bin
  "$HOME/.bun/bin/"	# JavaScript Backend,
  "$HOME/.config/broot/launcher/bash/br" # Broot cmd
  $path
)

typeset -U path
