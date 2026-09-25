#!/bin/sh
# {"batt":W,"gpu":W}  batt is 0 when on AC (current_now unreadable then)
b=/sys/class/power_supply/BAT0
c=$(cat $b/current_now 2>/dev/null); v=$(cat $b/voltage_now 2>/dev/null)
batt=$(awk -v c="${c:-0}" -v v="${v:-0}" 'BEGIN{x=c*v/1e12; if(x<0)x=-x; printf "%.1f", x}')
gpu=$(nvidia-smi --query-gpu=power.draw --format=csv,noheader,nounits 2>/dev/null | head -1)
# nvidia-smi may report "[N/A]" or nothing; only accept a number
case "$gpu" in ''|*[!0-9.]*) gpu=0 ;; esac
printf '{"batt":%s,"gpu":%s}\n' "${batt:-0}" "$gpu"
