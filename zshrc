# ~/.zshrc
# Homebrew (Apple Silicon) — .zprofile covers login shells, this covers the rest
if [ -x /opt/homebrew/bin/brew ] && [[ ":$PATH:" != *":/opt/homebrew/bin:"* ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# source config dir
# theme first so the palette is available to everything else
source ~/.config/zsh/theme.zsh
for f in ~/.config/zsh/*.zsh; do
    [ "$f" = ~/.config/zsh/theme.zsh ] && continue
    [ -r "$f" ] && . "$f"
done

export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.npm-global/bin:$PATH"

# compinit runs in zsh/plugins.zsh
autoload -U +X bashcompinit && bashcompinit
command -v terraform >/dev/null 2>&1 && \
    complete -o nospace -C "$(command -v terraform)" terraform
