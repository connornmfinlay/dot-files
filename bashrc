# ~/.bashrc
# source config dir
for f in ~/.config/bash/*.sh; do
    [ -r "$f" ] && . "$f"
done

