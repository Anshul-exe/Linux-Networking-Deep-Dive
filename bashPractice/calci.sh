#!/bin/bash

echo 'Enter your first no: '
read a
echo 'Enter your second no: '
read b
echo 'Select your operation
1. +
2. -
3. *
4. /'
read c

if ((c == 1)); then
  echo $((a + b))
elif ((c == 2)); then
  echo $((a - b))
elif ((c == 3)); then
  echo $((a * b))
elif ((c == 4)); then
  echo $((a / b))
fi
