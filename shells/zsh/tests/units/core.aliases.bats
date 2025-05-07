#!/usr/bin/env bats

setup() {
  export CONFIG_HOME="$HOME/40-Configs"
  export TARGET_TEST="$CONFIG_HOME/shells/zsh/cores/aliases.zsh"
}

# ===== describe: aliases.zsh 基本可用性 =====
@test "it should be sourceable without error" {
  run zsh -c "source \"$TARGET_TEST\""
  [ "$status" -eq 0 ]
}

# ===== describe: aliases.zsh 定義的快捷指令 =====
@test "it defines alias cd='z'" {
  skip "alias are available in interactive shell"
}

@test "it defines alias zz='zi'" {
  skip "alias are available in interactive shell"
}

@test "it defines alias ls='lsd'" {
  skip "alias are available in interactive shell"
}

@test "it defines alias ports='lsof -i -P | grep LISTEN'" {
  skip "alias are available in interactive shell"
}

@test "it defines alias myip='curl ifconfig.me'" {
  skip "alias are available in interactive shell"
}

@test "it defines alias reload='source ~/.zshrc'" {
  skip "alias are available in interactive shell"
}
