#!/bin/sh
# util%, vram used MiB, vram total MiB, temp C  (NVIDIA)
out=$(nvidia-smi --query-gpu=utilization.gpu,memory.used,memory.total,temperature.gpu \
  --format=csv,noheader,nounits 2>/dev/null | head -1 \
  | awk -F', *' '$1+0==$1 && $3>0 {printf "{\"util\":%d,\"used\":%d,\"total\":%d,\"temp\":%d}\n",$1,$2,$3,$4}')
echo "${out:-{\"util\":0,\"used\":0,\"total\":1,\"temp\":0\}}"
