path=(
  "$HOME/.cargo/bin" # Cargo bin
  "$HOME/.local/bin" # Local bin (XDG Standard)
  "$HOME/.lmstudio/bin" # LMStudio bin
  $path
)

typeset -U path
