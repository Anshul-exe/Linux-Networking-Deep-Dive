#!/bin/bash

num=$1

while [[ $num -le 10 ]]; do
  echo "$num"
  num=$((num + 1))
done

echo "ab for loop"

for shi in 1 2 3 4 5; do
  echo $shi
done

echo "ab for .. vala"

for bees in {0..20..2}; do #{starting..ending..increment}
  if [[ $norm -eq 4 || $norm -eq 8 ]]; then
    continue # 4 ya 8 jb milega toh unko skip krke age continue krdega
  fi
  echo $bees
done

echo "ab normal vala"

for ((norm = 0; norm <= 10; norm++)); do

  if [[ $norm -eq 4 ]]; then
    break # 4 milte hi loop ke bahar ajaega
  fi

  echo $norm
done
