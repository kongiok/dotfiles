#!/usr/bin/env zsh

# plugins loaded with sheldon
eval "$(sheldon source)"

# Specify whether to use Zellij or not
typeset -A should_open_zellij=(
  [default]       false
  Apple_Terminal  true
  iTerm.app       true
  WezTerm         true
  ZED_TERM        false
  TTY             true
)

if [ -t 1 ]; then
  TERM_PROGRAM="TTY"
fi


if [ "${should_open_zellij[${TERM_PROGRAM}]:-${should_open_zellij[\[default\]]}}" = true ]; then
  if [[ -z "$ZELLIJ" ]] && command -v zellij &>/dev/null; then
    exec zellij
  fi
fi
