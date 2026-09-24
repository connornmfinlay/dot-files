# Prompt — uses palette variables from theme.zsh

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

PROMPT='${_C_DIM}┌ ${_C_ACCENT}${_C_BOLD}%n${_C_RESET}${_C_DIM}@${_C_ACCENT}%m${_C_DIM}  ${_C_TEXT}%~${_C_ACCENT2}$(git_prompt)
${_C_DIM}└ %(?.${_C_ACCENT}.${_C_ACCENT2}${_C_BOLD})❯ ${_C_RESET}' 
