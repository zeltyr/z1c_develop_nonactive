cat rphost*/*.log |
grep -P 'CALL.+Context=' |
sed -r 's/\xef\xbb\xbf//; s/^[0-9]+:[0-9]+.[0-9]+-//; s/CALL.+Context=/CALL,Context=/;s/,Memory=.+$//' |
gawk -F',CALL,' '{Dur[$2]+=$1; Execs[$2]+=1} END {for (i in Dur) printf "%d %d %d %s\n", (Dur[i]/Execs[i])/1000, Dur[i]/1000, Execs[i], i}' |
sort -rn |
head -n 1000 |
sed '1i\AvgDuration,ms TotalDuration,ms Execs Context' > Apdex_prepared.txt