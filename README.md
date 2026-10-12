# dot-files

```
./install.sh            # brew packages + symlinks + iTerm2 profile
./install.sh --no-brew  # skip package installation
```

- `zshrc` → `~/.zshrc`; `zsh/`, `tmux/`, `nvim/` → `~/.config/` (symlinked, so edits here are live)
- iTerm2: `iterm2/dot-files-profile.json` is installed as a Dynamic Profile named "dot-files"
  (black/white, Menlo 14, Option sends Esc+). Re-run `install.sh` after editing it.
  Colour presets in `iterm2/themes/` can be imported with `open <file>.itermcolors`.
- Existing files are backed up as `<name>.bak.<timestamp>`.
