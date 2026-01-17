#!/usr/bin/env zsh

# plugins loaded with sheldon
eval "$(sheldon source)"

typeset -A should_open_zellij=(
  DEFAULT         false
  Apple_Terminal  true
  iTerm.app       true
  WezTerm         true
  ZED_TERM        false
  TTY             true
  SSH             true
)

local current_env="$TERM_PROGRAM"

if [[ -n "$SSH_CONNECTION" || -n "$SSH_CLIENT" || -n "$SSH_TTY" ]]; then
  current_env="SSH"
elif [[ -z "$current_env" ]]; then
  if [[ -t 1 ]]; then # check whether is TTY
    current_env="TTY"
  else
    current_env="DEFAULT"
  fi
fi

if [[ "${should_open_zellij[$current_env]:-${should_open_zellij[DEFAULT]}}" == "true" ]]; then
  if [[ -z "$ZELLIJ" ]] && command -v zellij &>/dev/null; then
    if [[ -o interactive ]]; then
      exec zellij
    fi
  fi
fi
