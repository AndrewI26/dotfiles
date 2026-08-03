#!/usr/bin/env bash
# Symlink VS Code config to this repo and install the tracked extensions.
set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
VSCODE_USER="$HOME/Library/Application Support/Code/User"
BACKUP_DIR="$HOME/.dotfiles-backup/$(date +%Y%m%d-%H%M%S)"

link() {
  local src="$REPO_DIR/$1" dest="$VSCODE_USER/$1"

  if [ -L "$dest" ]; then
    [ "$(readlink "$dest")" = "$src" ] && { echo "ok       $1"; return; }
    rm "$dest"
  elif [ -e "$dest" ]; then
    mkdir -p "$BACKUP_DIR"
    mv "$dest" "$BACKUP_DIR/$1"
    echo "backup   $1 -> $BACKUP_DIR/$1"
  fi

  ln -s "$src" "$dest"
  echo "linked   $1"
}

mkdir -p "$VSCODE_USER"
link settings.json
link keybindings.json
link custom.css

echo
echo "Installing extensions..."
while read -r ext; do
  [ -z "$ext" ] && continue
  code --install-extension "$ext" --force >/dev/null 2>&1 && echo "ext      $ext"
done < "$REPO_DIR/extensions.txt"
