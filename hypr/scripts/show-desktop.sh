#!/bin/env sh
TMP_FILE="$XDG_RUNTIME_DIR/hyprland-show-desktop"
CURRENT_WORKSPACE=$(hyprctl monitors -j | jq -r '.[] | select(.focused==true ) | .activeWorkspace.name')

if [ -s "$TMP_FILE-$CURRENT_WORKSPACE" ]; then
    readarray -d $'\n' -t ADDRESS_ARRAY <<< $(< "$TMP_FILE-$CURRENT_WORKSPACE")
    for address in "${ADDRESS_ARRAY[@]}"; do
        CMDS+="dispatch movetoworkspacesilent name:$CURRENT_WORKSPACE,address:$address;"
    done
    hyprctl --batch "$CMDS"
    rm "$TMP_FILE-$CURRENT_WORKSPACE"
else
    HIDDEN_WINDOWS=$(hyprctl clients -j | jq --arg CW "$CURRENT_WORKSPACE" \
        '.[] | select(.workspace.name==$CW) | .address' | sed 's/"//g')
    for address in $HIDDEN_WINDOWS; do
        echo "$address" >> "$TMP_FILE-$CURRENT_WORKSPACE"
        hyprctl dispatch movetoworkspacesilent special:desktop,address:$address
    done
fi
