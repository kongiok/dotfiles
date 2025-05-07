#!/usr/bin/env bash

# ===== Log ===== #
# Log utility functions

typeset -A logSeverity=(
  success "SUCCESS"
  info "INFO"
  warn "WARN"
  error "ERROR"
  debug "DEBUG"
  unknown "UNKNOWN"
)

typeset -A logColors=(
  INFO  "\033[0;34m"
  WARN  "\033[0;33m"
  ERROR "\033[0;31m"
  DEBUG "\033[0;90m"
  SUCCESS "\033[0;32m"
  RESET "\033[0m"
)

APP_NAME="${STARFORGE_APP_NAME:-Starforge}"
LOG_BASE_DIR="${LOG_BASE_DIR:-$HOME/30-Archives/005.43-Starforge/logs}"
if [[ ! -d "$LOG_BASE_DIR" ]];then
  mkdir -p "$LOG_BASE_DIR"
fi

log::_get_severity() {
  local level="$1"
  if [[ -v logSeverity[$level] ]]; then
    echo "${logSeverity[$level]}"
  else
    echo "${logSeverity[unknown]}"
  fi
}

log::_parse_arguments() {
  local argc=$#
  local section message
  case "$argc" in
    0)
      section="$APP_NAME"
      message="with no detail."
      ;;
    1)
      section="$APP_NAME"
      message="$1"
      ;;
    2)
      section="$2"
      message="$1"
      ;;
    *)
      section="$1"
      shift
      message="$*"
      ;;
  esac

  echo "$section|$message"
}

log::_print_colored_message() {
  local severity="$1"
  local section="$2"
  local message="$3"
  local color="${logColors[$severity]}"
  local reset="${logColors[RESET]}"

  echo -e "${color}${section}: [${severity}] -> ${message}${reset}"
}

# log::_write_to_file() {
#   local severity="$1"
#   local section="$2"
#   local message="$3"

#   #TODO: Implement time placeholder
#   local time_placeholder="__TIME__"
#   local today=$(date '+%Y-%m-%d')
#   local tz_offset=$(date +%z)
#   local tz_hour=$(echo "$tz_offset" | sed -E 's/^([+-])0?([0-9]{1,2}).*/\1\2/')
#   local log_file="$LOG_BASE_DIR/log-${today}_UTC${tz_hour}.log"
#   echo "$time_placeholder [$severity] [$section] $message" >> "$log_file"
# }

log::core() {
  local input_level="$1"
  shift

  local severity
  severity="$(log::_get_severity "$input_level")"

  local parsed
  parsed="$(log::_parse_arguments "$@")"

  local section="${parsed%%|*}"
  local message="${parsed#*|}"

  log::_print_colored_message "$severity" "$section" "$message"
  # log::_write_to_file "$severity" "$section" "$message"
}

log::info() { log::core info "$@" }
log::warn() { log::core warn "$@" }
log::error() { log::core error "$@" }
log::debug() { log::core debug "$@" }
log::success() { log::core success "$@" }
