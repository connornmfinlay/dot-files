# ~/.zshrc
# source config dir
for f in ~/.config/zsh/*.sh; do
    [ -r "$f" ] && . "$f"
done

export PATH="$HOME/.local/bin:$PATH"

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/bin/terraform terraform
