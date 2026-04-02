#!/bin/bash

# echo "Choose a number between 1-3"
# read a
#
# case "$a" in
# 1)
#   echo "you chose 1"
#   ;;
# 2)
#   echo "you chose 2"
#   ;;
# 3)
#   echo "you chose 3"
#   ;;
# *)
#   echo "Invalid choice"
#   ;;
# esac
#
# echo "now choose a file type"
# read b
#
# case "$b" in
# *.txt)
#   echo "you chose a txt file"
#   ;;
# *.png | *.jpg)
#   echo "you chose an image file"
#   ;;
# *.sh)
#   echo "you chose a bash file"
#   ;;
# *)
#   echo "tf bhai"
#   ;;
# esac

day=$1

case "$day" in
monday | tuesday | wed)
  echo "it is weekday"
  ;;
saturday | sunday)
  echo "it's the weekend"
  ;;
*)
  echo "Invalid selection"
  ;;
esac
