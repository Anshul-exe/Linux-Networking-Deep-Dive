#!/bin/bash

echo "give me your age"
read a

if [[ a -ge 18 && a -le 80 ]]; then
  echo "You can vote"
else
  echo "aye jaa naaa"
fi
