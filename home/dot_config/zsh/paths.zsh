path=(
  "$HOME/.cargo/bin" # Cargo bin
  "$HOME/.local/bin" # Local bin (XDG Standard)
  $path
)

typeset -U path
