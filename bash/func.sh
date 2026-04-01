#!/bin/bash

funcCheck() {
  val="Linux the G.O.A.T" # local var
}

val="leave Microsoft" # same name var but doesn't get effected coz upar vala local tha
echo $val

funcCheck
echo $val # vo function call hochuka hai so var update hogaya
