# Environment variables and colour exports

# Editor
export EDITOR=nvim
export VISUAL=nvim

# ls colours (light blue dominant)
export LS_COLORS="di=38;2;137;207;240:ln=38;2;224;64;251:ex=38;2;107;47;160:*.md=38;2;137;207;240:*.txt=38;2;137;207;240"

# grep highlight
export GREP_COLORS="mt=38;2;224;64;251"

# man pages (using less)
export LESS_TERMCAP_mb=$'\e[38;2;224;64;251m'     # begin blink
export LESS_TERMCAP_md=$'\e[38;2;137;207;240;1m'  # begin bold
export LESS_TERMCAP_me=$'\e[0m'                   # reset bold/blink
export LESS_TERMCAP_se=$'\e[0m'                   # reset standout
export LESS_TERMCAP_so=$'\e[38;2;107;47;160;1m'   # standout (search hits)
export LESS_TERMCAP_ue=$'\e[0m'                   # reset underline
export LESS_TERMCAP_us=$'\e[38;2;137;207;240;4m'  # begin underline
