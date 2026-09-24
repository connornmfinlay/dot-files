# Environment variables and colour exports — uses palette from theme.zsh
[ -z "$THEME_ACCENT" ] && source ~/.config/zsh/theme.zsh

export EDITOR=nvim
export VISUAL=nvim

# "#RRGGBB" -> "R;G;B"
_hex_rgb() { printf '%d;%d;%d' 0x${1:1:2} 0x${1:3:2} 0x${1:5:2}; }
_A=$(_hex_rgb $THEME_ACCENT)
_A2=$(_hex_rgb $THEME_ACCENT2)
_T=$(_hex_rgb $THEME_TEXT)
_BG=$(_hex_rgb $THEME_BG)

# ls colours: accent dominant, text colour for files
export LS_COLORS="di=38;2;${_A};1:ln=38;2;${_T}:ex=38;2;${_A2}:*.md=38;2;${_T}:*.txt=38;2;${_T}"

# grep match highlight
export GREP_COLORS="mt=38;2;${_A2};1"

# man pages
export LESS_TERMCAP_mb=$'\e[38;2;'"${_A2}m"                 # blink
export LESS_TERMCAP_md=$'\e[38;2;'"${_A2};1m"               # bold (headers)
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[38;2;'"${_BG};48;2;${_A2};1m"   # standout: search hits
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[38;2;'"${_T};4m"                # underline

unset _A _A2 _T _BG
unfunction _hex_rgb
