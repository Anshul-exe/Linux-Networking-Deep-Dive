#!/bin/bash

n1=32
n2=12

echo $((n1 + n2))
echo $(expr $n1 + $n2)
echo $((n1 * n2))
echo $(expr $n1 \* $n2) # expr function doesnt recognise astrix sign (*)

echo "Give your hex no. of choice:"
read hex

echo -n "The decimal value for $hex is: "
echo "obase=10; ibase=16; $hex" | bc
