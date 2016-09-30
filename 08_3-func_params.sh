#!/bin/bash
COUNTER=20
function my_function {
  until [ $COUNTER -lt 10 ]; do
    #echo COUNTER $COUNTER
    e $COUNTER  # pass the COUNTER to the 'e' function
    let COUNTER-=1
  done 
}

function quit {
  exit 
}
function hello {
  echo Hello 
}

# echos the 1st argument it receives
function e {
  echo $1 
}

hello 
e quit 
e hello 
e quit 
my_function 