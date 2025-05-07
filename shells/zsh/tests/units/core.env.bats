#!/usr/bin/env bats

setup() {
  export CONFIG_HOME="$HOME/40-Configs"
  export TARGET_TEST="$CONFIG_HOME/shells/zsh/cores/env.zsh"
}

@test "it should be sourceable without error" {
  run zsh -c "source '$TARGET_TEST'"
  [ "$status" -eq 0 ]
}

@test "It should have FORGEPART_DIR variable" {
  run zsh -c "
  source '$TARGET_TEST'
  return [[ -n \$FORGEPARTS_DIR ]]
  "
}

@test "It should have APP_NAME variable" {
  run zsh -c "
  source '$TARGET_TEST'
  return [[ -n \$APP_NAME ]]
  "
}
