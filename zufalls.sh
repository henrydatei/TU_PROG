summe=0
for i in {1..100}; do
  zufallszahl=$((RANDOM % 20 + 1))
  ergebnis=$(echo $zufallszahl | ./zahlenraten_extrem)
  summe=$(expr $summe + $ergebnis)
done

echo $summe
