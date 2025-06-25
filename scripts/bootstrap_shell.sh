#!/usr/bin/env bash
set -euo pipefail

# ⛏️ 安裝 Homebrew（僅限 macOS）
if ! command -v brew >/dev/null 2>&1; then
  echo "⚙️ 安裝 Homebrew..."
  NONINTERACTIVE=1 /bin/bash -c \
    "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  # 將 Homebrew 加入 PATH（根據系統架構）
  if [[ "$(uname -m)" == "arm64" ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
  else
    eval "$(/usr/local/bin/brew shellenv)"
  fi
fi

# 📦 安裝 xh
if ! command -v xh >/dev/null 2>&1; then
  echo "📦 安裝 xh..."
  brew install xh
fi

# 🐟 安裝 fish
if ! command -v fish >/dev/null 2>&1; then
  echo "🐟 安裝 fish..."
  brew install fish
fi

# 🧾 取得 fish 路徑
fish_path="$(command -v fish)"

# 🧷 確認 fish 是否已列入 /etc/shells
if ! grep -Fxq "$fish_path" /etc/shells; then
  echo "➕ 將 $fish_path 加入 /etc/shells"
  echo "$fish_path" | sudo tee -a /etc/shells >/dev/null
fi

# 👤 如果目前預設 shell 不是 fish，就切換
current_shell="$(dscl . -read ~/ UserShell | awk '{print $2}')"
if [[ "$current_shell" != "$fish_path" ]]; then
  echo "🌀 將預設 shell 切換為 fish"
  chsh -s "$fish_path"
fi

echo "✅ Shell 啟動環境準備完成"
