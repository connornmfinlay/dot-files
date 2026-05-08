#
# ~/.bashrc
#

if [ -z "$WAYLAND_DISPLAY" ] && [ "$XDG_VNTR" = "1" ];then
  exec start-hyprland
fi
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'

alias vim=nvim

export EDITOR=nvim
export VISUAL=nvim

### Prompts
# ── Git branch helper ─────────────────────────────────────────
git_prompt() {
    local branch=$(git branch --show-current 2>/dev/null)
    [ -z "$branch" ] && return
    local dirty=$(git status --porcelain 2>/dev/null | wc -l)
    if [ "$dirty" -gt 0 ]; then
        echo " ($branch ✗)"
    else
        echo " ($branch ✓)"
    fi
}

# Add this block to the bottom of your ~/.bashrc
#
# Colours (wallpaper-matched):
#   Light blue  #89CFF0  → \e[38;2;137;207;240m
#   Pink        #E040FB  → \e[38;2;224;64;251m
#   Dark purple #1A0A2E  (terminal background — set in your terminal emulator)
#   Mid purple  #6B2FA0  → \e[38;2;107;47;160m
#   Reset                → \e[0m

# ── Colour variables ─────────────────────────────────────────
_C_BLUE='\[\e[38;2;137;207;240m\]'   # #89CFF0 — user, path
_C_PINK='\[\e[38;2;224;64;251m\]'    # #E040FB — git branch / root indicator
_C_PURP='\[\e[38;2;107;47;160m\]'    # #6B2FA0 — separators / secondary text
_C_RESET='\[\e[0m\]'
_C_BOLD='\[\e[1m\]'

# ── Prompt ────────────────────────────────────────────────────
_set_ps1() {
  local exit_code=$?
  local arrow_color

  if [ $exit_code -ne 0 ]; then
    arrow_color='\[\e[38;2;224;64;251m\]'
  else
    arrow_color='\[\e[38;2;137;207;240m\]'
  fi

  PS1="${_C_PURP}┌ "
  PS1+="${_C_BLUE}${_C_BOLD}\u${_C_RESET}"
  PS1+="${_C_PURP}@${_C_BLUE}\h"
  PS1+="${_C_PURP}  \w"
  PS1+="${_C_PINK}$(git_prompt)"
  PS1+="\n${_C_PURP}└ ${arrow_color}❯ ${_C_RESET}"
}

PROMPT_COMMAND='_set_ps1; history -a'

# ── ls colours (light blue dominant) ─────────────────────────
export LS_COLORS="di=38;2;137;207;240:ln=38;2;224;64;251:ex=38;2;107;47;160:*.md=38;2;137;207;240:*.txt=38;2;137;207;240"

# ── grep highlight ─────────────────────────────────────────────
export GREP_COLORS="mt=38;2;224;64;251"

# ── man pages (using less) ─────────────────────────────────────
export LESS_TERMCAP_mb=$'\e[38;2;224;64;251m'     # begin blink
export LESS_TERMCAP_md=$'\e[38;2;137;207;240;1m'  # begin bold
export LESS_TERMCAP_me=$'\e[0m'                    # reset bold/blink
export LESS_TERMCAP_se=$'\e[0m'                    # reset standout
export LESS_TERMCAP_so=$'\e[38;2;107;47;160;1m'   # standout (search hits)
export LESS_TERMCAP_ue=$'\e[0m'                    # reset underline
export LESS_TERMCAP_us=$'\e[38;2;137;207;240;4m'  # begin underline


### Fuzzy Finder
# fzf history search — Ctrl+R
export FZF_DEFAULT_OPTS="
  --color=bg+:#1A0A2E,bg:#0D0019,spinner:#E040FB,hl:#89CFF0
  --color=fg:#89CFF0,header:#6B2FA0,info:#E040FB,pointer:#E040FB
  --color=marker:#E040FB,fg+:#89CFF0,prompt:#6B2FA0,hl+:#E040FB
  --height 40% --reverse --border
"

# Bind Ctrl+R to fzf history
source /usr/share/fzf/key-bindings.bash

### History Settings
export HISTCONTROL=ignoreboth
export HISTSIZE=2000
export HISTFILESIZE=5000

### Zoxide
eval "$(zoxide init bash)"
