# History Settings
HISTFILE=~/.zsh_history
HISTSIZE=5000
SAVEHIST=5000           # zsh writes nothing to HISTFILE unless this is > 0
setopt append_history
setopt share_history
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_find_no_dups

# Orca's shell wrapper repoints HISTFILE at a per-terminal file on the first
# prompt, which splits history from tmux panes and plain ssh shells. Its hook is
# registered before this file loads, so this one runs after it and pins it back.
_pin_histfile() { HISTFILE=~/.zsh_history }
precmd_functions+=(_pin_histfile)
