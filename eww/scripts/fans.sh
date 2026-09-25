#!/bin/sh
# {"cpu":RPM,"gpu":RPM} from Dell hwmon (dell_ddv is labelled; dell_smm as fallback).
# hwmon numbers change between boots, so find the chip by name.
for want in dell_ddv dell_smm; do
  for h in /sys/class/hwmon/hwmon*; do
    [ "$(cat "$h/name" 2>/dev/null)" = "$want" ] || continue
    c=$(cat "$h/fan1_input" 2>/dev/null); g=$(cat "$h/fan2_input" 2>/dev/null)
    [ -n "$c$g" ] && { printf '{"cpu":%d,"gpu":%d}\n' "${c:-0}" "${g:-0}"; exit; }
  done
done
echo '{"cpu":0,"gpu":0}'
