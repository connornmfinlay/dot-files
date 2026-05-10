# Bash prompt customisation
# Colours (wallpaper-matched):
#   Light blue  #89CFF0  -> user, path
#   Pink        #E040FB  -> git branch / error indicator
#   Mid purple  #6B2FA0  -> separators / secondary text
#   Dark purple #1A0A2E  -> terminal background (set in emulator)

# Colour variables
_C_BLUE='\[\e[38;2;137;207;240m\]'
_C_PINK='\[\e[38;2;224;64;251m\]'
_C_PURP='\[\e[38;2;107;47;160m\]'
_C_RESET='\[\e[0m\]'
_C_BOLD='\[\e[1m\]'

# Git branch helper
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

# Prompt builder
_set_ps1() {
    local exit_code=$?
    local arrow_color
    if [ $exit_code -ne 0 ]; then
        arrow_color='\[\e[38;2;224;64;251m\]'   # pink on failure
    else
        arrow_color='\[\e[38;2;137;207;240m\]'  # blue on success
    fi
    PS1="${_C_PURP}┌ "
    PS1+="${_C_BLUE}${_C_BOLD}\u${_C_RESET}"
    PS1+="${_C_PURP}@${_C_BLUE}\h"
    PS1+="${_C_PURP}  \w"
    PS1+="${_C_PINK}$(git_prompt)"
    PS1+="\n${_C_PURP}└ ${arrow_color}❯ ${_C_RESET}"
}

PROMPT_COMMAND='_set_ps1; history -a'
