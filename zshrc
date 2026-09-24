# ~/.zshrc
# source config dir
# theme first so the palette is available to everything else
source ~/.config/zsh/theme.zsh
for f in ~/.config/zsh/*.zsh; do
    [ "$f" = ~/.config/zsh/theme.zsh ] && continue
    [ -r "$f" ] && . "$f"
done

export PATH="$HOME/.local/bin:$PATH"

autoload -Uz compinit && compinit
autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/bin/terraform terraform
