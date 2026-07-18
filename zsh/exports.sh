# Environment variables and colour exports

export EDITOR=nvim
export VISUAL=nvim

# ls colours: neon blue dominant, white for files
export LS_COLORS="di=38;2;63;191;254;1:ln=38;2;255;255;255:ex=38;2;63;191;254:*.md=38;2;255;255;255:*.txt=38;2;255;255;255"

# grep match highlight
export GREP_COLORS="mt=38;2;63;191;254;1"

# man pages
export LESS_TERMCAP_mb=$'\e[38;2;63;191;254m'      # blink
export LESS_TERMCAP_md=$'\e[38;2;63;191;254;1m'    # bold (headers)
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[38;2;0;0;0;48;2;63;191;254;1m'  # standout: black-on-neon (search hits)
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[38;2;255;255;255;4m'   # underline: white

