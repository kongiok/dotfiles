# ===== Paths ===== #
source "$CONFIG_HOME/shells/shared/log.sh"

typeset -aU local_paths
local_paths=(
  "$HOME/bin"
  "$HOME/.cargo/bin"
  "/usr/local/bin"
  "/usr/local/sbin"
  "/usr/bin"
  "/bin"
  "/usr/sbin"
  "/sbin"
)

# paths::add <dir> [append|prepend]
paths::add() {
  local dir=$1
  local position=${2:-prepend}

  # 忽略空值
  [[ -z "$dir" ]] && return

  # 若目錄不存在可選擇略過（或放開限制）
  if [[ ! -d "$dir" ]]; then
    log::error "Directory $dir does not exist"
    return 1
  fi

  # 如果已經存在於 $path 中就略過
  if [[ "${path[@]}" == *"$dir"* ]]; then
    return
  fi

  # 加入到前面或後面
  if [[ "$position" == "append" ]]; then
    path+=("$dir")
  else
    path=("$dir" "${path[@]}")
  fi

  export PATH  # 同步更新
  log::info "✅ Added $dir to PATH ($position)"
}


paths::setup() {
  local before=$PATH
  typeset -aU combined_paths=(
    "${local_paths[@]}"
    "${paths[@]}"
  )
  path=(
    "${combined_paths[@]}"
  )
  export PATH
  local after=$PATH
  if [[ "$before" != "$after" ]]; then
    log::success "PATH updated"
  else
    log::warn "PATH unchanged"
  fi
  log::success "Paths setup completed"
}
