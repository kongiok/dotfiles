#!/usr/bin/env bats

setup() {
  export CONFIG_HOME="$HOME/40-Configs"
  export TARGET_TEST="$CONFIG_HOME/shells/zsh/cores/paths.zsh"
  export MOCK_PATH="$CONFIG_HOME/sample.bak/bin/"
  mkdir -p "$MOCK_PATH"
}

@test "it should be sourceable without error" {
  run zsh -c "source '$TARGET_TEST'"
  [ "$status" -eq 0 ]
}

@test "paths::setup should include path that I added (prepend)" {
  run zsh -c '
    export ZSH_CONFIG_HOME="$HOME/40-Configs"
    source "$ZSH_CONFIG_HOME/shells/zsh/cores/paths.zsh"
    paths::setup
    echo "$PATH"
  '
  echo "$output"
  [[ "$output" == *"$HOME/bin"* ]]
}

@test "paths::add should append path to the end" {
  run zsh -c '
    source "$CONFIG_HOME/shells/zsh/cores/paths.zsh"

    # 記錄初始 path 長度
    before=($(echo $PATH | tr ":" "\n"))
    before_count=${#before[@]}

    paths::add "$MOCK_PATH" append
    after=($(echo $PATH | tr ":" "\n"))
    after_count=${#after[@]}

    echo "LAST=${after[-1]}"
    echo "COUNT=$after_count"
    return [[ "$after_count" -eq "$((before_count + 1))" ]]
  '
}

teardown() {
  rmdir "$MOCK_PATH"
}
