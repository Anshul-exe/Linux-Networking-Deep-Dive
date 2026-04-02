#!/bin/bash

echo "first string?"
read st1

echo "second string?"
read st2

echo ${st1^}   #lowercase
echo ${st1^^}  #uppercase
echo ${st1^^l} #specify letter switch case eg: input=hello output=heLLo
