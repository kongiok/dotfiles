#!/bin/bash

printf "Novahelm dotfiles | dotfiles installing...\n";

if [[ "$(uname)" == "Darwin" ]];then
	printf "Developer tools | detected macOS.\n";
	if xcode-select -p &>/dev/null; then
		printf "Developer tools | developer tools detected.\n"
	else
		printf "Developer tools | installing developer tools.\n"
		xcode-select --install;
		printf "please complete the installation...\n";
		printf "This might take a few minutes.\n";
		while ! xcode-select -p &>/dev/null; do
			sleep 5
		done
	fi
fi

sh -c "$(curl -fsLS get.chezmoi.io)" -- -b $HOME/.local/bin init --apply kongiok
