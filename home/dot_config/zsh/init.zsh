#!/usr/bin/env zsh

# plugins loaded with sheldon
eval "$(sheldon source)"

if [[ -z "$ZELLIJ" ]] && command -v zellij &>/dev/null; then
  exec zellij
fi
