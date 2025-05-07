# Check if HOME config directory exists
if [[ -z "$CONFIG_HOME" ]]; then
  echo "❌ ZSH_CONFIG_HOME has not been defined, please check whether .zshenv is correctly set"
  return 1
fi

source $CONFIG_HOME/shells/shared/log.sh

log::info "Setting up Z Shell..."

source $ZDOTDIR/cores/env.zsh
log::success "Environments Variables Loaded"

# Download Znap, if it's not there yet.
if [[ -r $STARFORGE_PARTS_DIR/znap/znap.zsh ]] {
  git clone --depth 1 -- \
  https://github.com/marlonrichert/zsh-snap.git $STARFORGE_PARTS_DIR/znap
}

source $ZDOTDIR/cores/paths.zsh
paths::setup
log::success "Paths Loaded"
source $ZDOTDIR/cores/aliases.zsh
log::success "Aliases Loaded"
source $ZDOTDIR/cores/plugins.zsh
log::success "Plugins Loaded"

# Starforge Modules
local -a starforge_modules=(
  "components:$STARFORGE_COMPONENTS_DIR"
  "extensions:$STARFORGE_EXTENSIONS_DIR"
)

# Run Each Module Parrells
log::info "Loading Modules..."
for entry in $starforge_modules; do
  local kind="${entry%%:*}"
  local dir="${entry#*:}"

  if [[ -z "$dir" ]]; then
    log::error "could not find $kind" "ModuleLoader"
    continue
  fi

  for f in "$dir"/[0-9][0-9][0-9]-*.zsh(N); do
    [[ -f "$f" ]] || continue
    name="${f:t}"
    name="${name#*-}"
    name="${name%.zsh}"
    log::info "Loading ${name}" "$kind"
    source "$f"
  done
  log::success "Module Loaded" "$kind"
done

# Wait until each process done.
wait
