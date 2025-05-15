eval "$(starship init zsh)"

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

if [ ! -d "ZINIT_HOME" ]; then
  mkdir -p "$(dirname $ZINIT_HOME)"
  git clone git@github.com:zdharma-continuum/zinit.git "$ZINIT_HOME" 2> /dev/null
fi

source "${ZINIT_HOME}/zinit.zsh"

zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)
ZSH_HIGHLIGHT_STYLES[history-expansion]='fg=#D433FF'

zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::brew
zinit snippet OMZP::common-aliases
zinit snippet OMZP::rust
zinit snippet OMZP::golang
zinit snippet OMZP::ssh
zinit snippet OMZP::command-not-found

zi light zdharma-continuum/zinit-annex-rust

#Load Completions
autoload -U compinit && compinit

zinit cdreplay -q

#History settings
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

#Complete styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'


#Bindings
bindkey -e
bindkey '^p' history-search-forward
bindkey '^n' history-search-backwords

alias ls="ls --color"
alias ll="ls -al"
alias ll="ls -laF"

alias linkage="python3 /Users/cfinlay/Documents/OneDrive\ -\ University\ of\ Edinburgh/Work-Projects/dscs/dscs_shift_stuff/scripts/linkage"
alias pp="python3 /Users/cfinlay/Documents/OneDrive\ -\ University\ of\ Edinburgh/Work-Projects/dscs/shift-stuff/password.py"
alias rustlings="/Users/cfinlay/.cargo/bin/rustlings"
alias group="python3 /Users/cfinlay/Documents/OneDrive\ -\ University\ of\ Edinburgh/work-projects/dscs/shift-stuff/shs-script/command-gen.py"

alias p="/Users/cfinlay/Documents/OneDrive\ -\ University\ of\ Edinburgh/projects/rust/rust-programs/pass-gen/target/debug/pass-gen"

# Shell Integrations
eval "$(fzf --zsh)"
eval "$(zoxide init zsh)"
eval "$(zoxide init --cmd cd zsh)"
eval "$(/opt/homebrew/bin/brew shellenv)"

export LDFLAGS="-L/opt/homebrew/opt/llvm/lib"
export CPPFLAGS="-I/opt/homebrew/opt/llvm/include"

export CLICOLOR=1
export LSCOLORS=gxfxbxdxcxegedabagacad

export PATH="/opt/homebrew/opt/llvm/bin:$PATH"

