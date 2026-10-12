#!/usr/bin/env bash
# Set up these dot-files on macOS (also works on Linux, minus brew/iTerm2).
#   ./install.sh            install packages, symlink configs, install iTerm2 profile
#   ./install.sh --no-brew  skip package installation
# Existing files are moved to <name>.bak.<timestamp>, never overwritten.
set -euo pipefail

DOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONFIG="${XDG_CONFIG_HOME:-$HOME/.config}"
STAMP="$(date +%Y%m%d-%H%M%S)"
USE_BREW=1
[ "${1:-}" = "--no-brew" ] && USE_BREW=0

say() { printf '\033[1m==> %s\033[0m\n' "$*"; }

link() { # link <repo-relative source> <absolute target>
    local src="$DOT/$1" dst="$2"
    mkdir -p "$(dirname "$dst")"
    if [ -L "$dst" ] && [ "$(readlink "$dst")" = "$src" ]; then
        echo "ok      $dst"
        return
    fi
    if [ -e "$dst" ] || [ -L "$dst" ]; then
        mv "$dst" "$dst.bak.$STAMP"
        echo "backup  $dst -> $dst.bak.$STAMP"
    fi
    ln -s "$src" "$dst"
    echo "link    $dst -> $src"
}

# ── packages ────────────────────────────────────────────────
if [ "$USE_BREW" = 1 ] && command -v brew >/dev/null 2>&1; then
    say "Homebrew packages"
    brew install fzf tmux neovim zoxide ripgrep
fi

# ── zsh / tmux / nvim ───────────────────────────────────────
say "Linking configs"
link zshrc      "$HOME/.zshrc"
link zsh        "$CONFIG/zsh"
link tmux       "$CONFIG/tmux"
link nvim       "$CONFIG/nvim"

# ── iTerm2 ──────────────────────────────────────────────────
if [ "$(uname)" = "Darwin" ]; then
    say "iTerm2 profile"
    DP="$HOME/Library/Application Support/iTerm2/DynamicProfiles"
    mkdir -p "$DP"
    cp "$DOT/iterm2/dot-files-profile.json" "$DP/dot-files.json"
    echo "copied  $DP/dot-files.json"
    if pgrep -x iTerm2 >/dev/null; then
        echo "iTerm2 is running: pick Profiles > dot-files, then 'Other Actions > Set as Default'."
    else
        defaults write com.googlecode.iterm2 "Default Bookmark Guid" -string "6F1A2B3C-D0F1-4E5A-9A00-D07F11E50001"
        echo "set 'dot-files' as the default iTerm2 profile"
    fi
    echo "optional colour presets: open $DOT/iterm2/themes/<name>.itermcolors"
fi

say "Done. Open a new terminal (or: exec zsh)."
