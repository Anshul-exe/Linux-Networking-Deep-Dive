#!/bin/bash

ls +al 1>st.txt 2>&1 #iss stout and sterr dono st.txt me jaa skte hai
ls -al >&st.txt      #same as above but better
