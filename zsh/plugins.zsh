# Plugins via zinit (auto-installs on first shell; needs network once)
ZINIT_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/zinit/zinit.git"
if [ ! -d "$ZINIT_HOME" ]; then
    mkdir -p "$(dirname "$ZINIT_HOME")"
    git clone --depth 1 https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME" 2>/dev/null
fi

autoload -Uz compinit

if [ -r "$ZINIT_HOME/zinit.zsh" ]; then
    source "$ZINIT_HOME/zinit.zsh"

    # completions must be on fpath before compinit
    zinit light zsh-users/zsh-completions

    zinit snippet OMZP::git
    zinit snippet OMZP::sudo
    zinit snippet OMZP::brew
    zinit snippet OMZP::common-aliases
    zinit snippet OMZP::golang
    zinit snippet OMZP::ssh

    compinit
    zinit cdreplay -q

    # fzf-tab after compinit; syntax-highlighting last
    zinit light Aloxaf/fzf-tab
    zinit light zsh-users/zsh-autosuggestions

    ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)
    zinit light zsh-users/zsh-syntax-highlighting
    ZSH_HIGHLIGHT_STYLES[history-expansion]='fg=#D433FF'
else
    compinit
fi

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
if [[ "$OSTYPE" == darwin* ]]; then
    _preview='ls -G $realpath'
else
    _preview='ls --color $realpath'
fi
zstyle ':fzf-tab:complete:cd:*' fzf-preview "$_preview"
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview "$_preview"
unset _preview

# Bindings
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
