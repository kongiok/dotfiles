#!/usr/bin/env zsh

# plugins loaded with sheldon
eval "$(sheldon source)"

# Customization for interactive shell
if [ "${ZED_TERM}" ] && [[ "${ZED_TERM}" == "true" ]] ;then
	return
fi

if [[ -z "$ZELLIJ" ]] && command -v zellij &>/dev/null; then
  exec zellij
fi
