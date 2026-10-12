if [[ "$OSTYPE" == darwin* ]]; then
    alias ls='ls -G'            # BSD ls has no --color
else
    alias ls='ls --color=auto'
fi
alias grep='grep --color=auto'
alias vim=nvim
