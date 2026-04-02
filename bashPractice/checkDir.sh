#!/bin/bash

echo "Search for the directory:"
read dir

if [[ -d "$dir" ]]; then
  echo "$dir exists"
else
  echo "$dir doesn't exist"
fi

# 1:45:41 to continue from here
