#!/bin/sh
# Top 5 processes by CPU, grouped by program name (second top sample = current usage).
# Uses the full command line (-c) because the kernel truncates process names to 15 chars.
n=$(nproc)
top -bn2 -d 1 -c -w 512 | awk -v n="$n" '
  /^ *PID/ {i++; next}
  i==2 && NF>=12 {
    cmd = $12; for (j = 13; j <= NF; j++) cmd = cmd " " $j
    if (cmd ~ /^\[/) { gsub(/^\[|\]$/, "", cmd); sub(/\/.*/, "", cmd) }   # [kworker/u8:0] -> kworker
    else { sub(/ .*/, "", cmd); sub(/.*\//, "", cmd); sub(/:$/, "", cmd) } # /usr/bin/foo --x -> foo
    c[cmd] += $9
  }
  END {for (k in c) printf "%s\t%.0f\n", k, c[k]/n}' \
  | sort -t "$(printf '\t')" -k2 -nr | head -5 \
  | awk -F '\t' '{k=$1; if (length(k) > 24) k = substr(k, 1, 23) "…"; printf "%-24s %3s%%\n", k, $2}'
