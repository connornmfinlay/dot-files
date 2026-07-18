# ~/.zshrc
# source config dir
for f in ~/.config/zsh/*.sh; do
    [ -r "$f" ] && . "$f"
done

export PATH="$HOME/.local/bin:$PATH"
