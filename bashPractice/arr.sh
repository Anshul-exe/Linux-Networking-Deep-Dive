#!/bin/bash

car=('bmw' 'toyota' 'honda' 'RR')

unset car[2] # to remove the index

car[2]="mercedes"

echo "${car[@]}"
echo "${!car[@]}" # to show present index
echo "${#car[@]}" # to show no. of index
