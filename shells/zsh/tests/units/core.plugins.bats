#!/usr/bin/env bats

setup() {
  export CONFIG_HOME="$HOME/40-Configs"
  export TARGET_TEST="$CONFIG_HOME/shells/zsh/cores/plugins.zsh"
}

@test "it should be sourceable without error" {
  run zsh -c "source \"$TARGET_TEST\""
  [ "$status" -eq 0 ]
}

@test "it loads starship theme" {
  skip "plugin loading should be tested in integration shell"
}

@test "it enables zsh-autosuggestions" {
  skip "plugin behavior is available in interactive shell"
}

@test "it enables zsh-completions" {
  skip "plugin behavior is available in interactive shell"
}

@test "it enables zsh-syntax-highlighting" {
  skip "plugin behavior is available in interactive shell"
}
