#!/bin/sh
# Keep the resources window on the 34" ultrawide (matched by physical
# width, since dock connector names change on replug), else the laptop
# panel, else the first monitor. Reopens whenever the monitor layout changes.
pick() {
  xrandr --listmonitors | awk '
    NR>1 { split($3, w, "[/x]"); name=$NF
           if (w[2] >= 780) wide=name
           if (name ~ /^eDP/) lap=name
           if (!first) first=name }
    END { print (wide ? wide : lap ? lap : first) }'
}

eww daemon
last=
while :; do
  layout=$(xrandr --listmonitors)
  if [ "$layout" != "$last" ]; then
    last=$layout
    sleep 2  # let the new layout settle
    eww close resources >/dev/null 2>&1
    eww open resources --screen "$(pick)"
  fi
  sleep 3
done
