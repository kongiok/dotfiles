export PAGER="nvimpager"
export HOMEBREW_NO_ENV_HINTS=true

if command -v brew >/dev/null 2>&1; then
	eval "$(brew shellenv)"
fi
if command -v mise >/dev/null 2>&1; then
	eval "$(mise activate zsh)"
fi
