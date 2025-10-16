#!/usr/bin/env bash

if [[ "$(uname)" != "Darwin" ]]; then
  exit 0
fi

printf "brew pkgs | installing packages\n"

if ! command -v brew >/dev/null 2>&1; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  if [[ ! $? -eq 0 ]]; then
    printf "brew pkgs | unabled to install brew package manager.\nTry install it on your own and run this script again." >&2
  fi
fi

if ! command -v brew >/dev/null 2>&1; then
  printf "brew pkgs | there's no brew command right there" >&2
fi

brewfile="$HOME/.config/pkgs/osx/Brewfile"

if [[ ! -f $brewfile ]]; then
  printf "brew pkgs | there's no brew files\n" >&2
  exit 1
fi

brew bundle --file $brewfile

if [[ ! $? -eq 0 ]]; then
  printf "brew pkgs | unabled to install pkgs by using $(brew bundle)" >&2
fi
