### Fuzzy Finder
[ -z "$THEME_ACCENT" ] && source ~/.config/zsh/theme.zsh
export FZF_DEFAULT_OPTS="
  --color=bg+:$THEME_BG_ALT,bg:$THEME_BG,spinner:$THEME_ACCENT2,hl:$THEME_ACCENT
  --color=fg:$THEME_TEXT,header:$THEME_ACCENT,info:$THEME_TEXT,pointer:$THEME_ACCENT2
  --color=marker:$THEME_ACCENT2,fg+:$THEME_TEXT,prompt:$THEME_ACCENT,hl+:$THEME_ACCENT2
  --height 40% --reverse --border
"
# Arch/EndeavourOS and Fedora install the key bindings in different places
for f in /usr/share/fzf/key-bindings.zsh /usr/share/fzf/shell/key-bindings.zsh; do
    [ -r "$f" ] && source "$f" && break
done
