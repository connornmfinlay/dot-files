# Environment variables and colour exports

export EDITOR=nvim
export VISUAL=nvim

# Colour palette auto-swaps by OS, matching nvim/tmux:
#   macOS -> pure black & white (monochrome; weight/underline carry hierarchy)
#   else  -> neon blue dominant, white for files
if [ "$(uname)" = "Darwin" ]; then
    export LS_COLORS="di=1;38;2;255;255;255:ln=38;2;204;204;204:ex=4;38;2;255;255;255:*.md=38;2;204;204;204:*.txt=38;2;204;204;204"
    export GREP_COLORS="mt=1;38;2;255;255;255"
    export LESS_TERMCAP_mb=$'\e[38;2;255;255;255m'          # blink
    export LESS_TERMCAP_md=$'\e[1;38;2;255;255;255m'        # bold (headers)
    export LESS_TERMCAP_so=$'\e[38;2;0;0;0;48;2;255;255;255;1m'  # standout: black-on-white (search hits)
else
    export LS_COLORS="di=38;2;63;191;254;1:ln=38;2;255;255;255:ex=38;2;63;191;254:*.md=38;2;255;255;255:*.txt=38;2;255;255;255"
    export GREP_COLORS="mt=38;2;63;191;254;1"
    export LESS_TERMCAP_mb=$'\e[38;2;63;191;254m'           # blink
    export LESS_TERMCAP_md=$'\e[38;2;63;191;254;1m'         # bold (headers)
    export LESS_TERMCAP_so=$'\e[38;2;0;0;0;48;2;63;191;254;1m'  # standout: black-on-neon (search hits)
fi
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[38;2;255;255;255;4m'   # underline: white

