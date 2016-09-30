#!/bin/bash
COUNTER=20
function my_function {
  until [ $COUNTER -lt 10 ]; do
    echo COUNTER $COUNTER
    let COUNTER-=1
  done 
}

my_function 