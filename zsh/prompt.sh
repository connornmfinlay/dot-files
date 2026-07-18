# Bash prompt customisation
_C_NEON=$'%{\e[38;2;63;191;254m%}'   # neon blue
_C_WHITE=$'%{\e[38;2;255;255;255m%}'
_C_DIM=$'%{\e[38;2;128;128;128m%}'   # grey for separators
_C_RESET=$'%{\e[0m%}'
_C_BOLD=$'%{\e[1m%}'

git_prompt() {
    local branch
    branch=$(git branch --show-current 2>/dev/null)
    [ -z "$branch" ] && return
    local dirty
    dirty=$(git status --porcelain 2>/dev/null | wc -l)
    if [ "$dirty" -gt 0 ]; then
        echo " ($branch ✗)"
    else
        echo " ($branch ✓)"
    fi
}

setopt PROMPT_SUBST

PROMPT='${_C_DIM}┌ ${_C_NEON}${_C_BOLD}%n${_C_RESET}${_C_DIM}@${_C_NEON}%m${_C_DIM}  ${_C_WHITE}%~${_C_NEON}$(git_prompt)
${_C_DIM}└ %(?.${_C_NEON}.${_C_WHITE}${_C_BOLD})❯ ${_C_RESET}'


