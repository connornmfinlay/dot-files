#!/bin/sh
sensors 2>/dev/null | awk '/Package id 0/{gsub(/[+°C]/,"",$4); printf "%d\n",$4; exit}'
