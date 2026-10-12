# Machine/work-specific aliases and flags (restored from the old mac-zshrc)

alias sst="ssh -t hsupport01 ssh "
alias cst='ssh -t crosswood01 ssh '
alias lst='ssh -t loch01 ssh '

alias linkage="python3 /Users/cfinlay/Documents/OneDrive\ -\ University\ of\ Edinburgh/Work-Projects/dscs/dscs_shift_stuff/scripts/linkage"
alias pp="python3 /Users/cfinlay/Documents/OneDrive\ -\ University\ of\ Edinburgh/Work-Projects/dscs/shift-stuff/passwords-scripts/password.py"
alias rustlings="/Users/cfinlay/.cargo/bin/rustlings"
alias group="python3 /Users/cfinlay/Documents/OneDrive\ -\ University\ of\ Edinburgh/work-projects/dscs/shift-stuff/shs-script/command-gen.py"

alias p="/Users/cfinlay/Documents/OneDrive\ -\ University\ of\ Edinburgh/projects/rust/rust-programs/pass-gen/target/debug/pass-gen"
alias lp="/Users/cfinlay/OneDrive\ -\ University\ of\ Edinburgh/projects/golang/wordpassgen/longpass"

# Homebrew LLVM
if [ -d /opt/homebrew/opt/llvm ]; then
    export LDFLAGS="-L/opt/homebrew/opt/llvm/lib"
    export CPPFLAGS="-I/opt/homebrew/opt/llvm/include"
    export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
fi
