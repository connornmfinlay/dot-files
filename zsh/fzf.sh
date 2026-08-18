### Fuzzy Finder
# Accent colour auto-swaps by OS, matching nvim/tmux/zsh prompt:
#   macOS -> pure black & white (monochrome; bold carries the accent)
#   else  -> neon blue
if [ "$(uname)" = "Darwin" ]; then
    export FZF_DEFAULT_OPTS="
      --color=bg+:#1A1A1A,bg:#000000,spinner:bold:#FFFFFF,hl:bold:#FFFFFF
      --color=fg:#FFFFFF,header:bold:#FFFFFF,info:#FFFFFF,pointer:bold:#FFFFFF
      --color=marker:bold:#FFFFFF,fg+:#FFFFFF,prompt:bold:#FFFFFF,hl+:bold:#FFFFFF
      --height 40% --reverse --border
    "
else
    export FZF_DEFAULT_OPTS="
      --color=bg+:#1A1A1A,bg:#000000,spinner:#3FBFFE,hl:#3FBFFE
      --color=fg:#FFFFFF,header:#3FBFFE,info:#FFFFFF,pointer:#3FBFFE
      --color=marker:#3FBFFE,fg+:#FFFFFF,prompt:#3FBFFE,hl+:#3FBFFE
      --height 40% --reverse --border
    "
fi
source /usr/share/fzf/shell/key-bindings.zsh
