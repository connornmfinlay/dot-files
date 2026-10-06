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
