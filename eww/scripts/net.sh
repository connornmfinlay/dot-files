#!/bin/sh
# Default-interface throughput sampled over 1s.
# {"down":KB/s,"up":KB/s,"down_s":"label","up_s":"label"}
i=$(ip -o route show default | awk '{for(k=1;k<=NF;k++) if($k=="dev"){print $(k+1); exit}}')
[ -z "$i" ] && { echo '{"down":0,"up":0,"down_s":"–","up_s":"–"}'; exit; }
rd() { awk -v i="$i:" '$1==i{print $2, $10}' /proc/net/dev; }
a=$(rd); sleep 1; b=$(rd)
echo "$a $b" | awk '
  function fmt(x){ return x>1048576 ? sprintf("%.1f MB/s",x/1048576) : sprintf("%d KB/s",x/1024) }
  {d=$3-$1; u=$4-$2;
   printf "{\"down\":%d,\"up\":%d,\"down_s\":\"%s\",\"up_s\":\"%s\"}\n", d/1024, u/1024, fmt(d), fmt(u)}'
