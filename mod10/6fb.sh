#!/bin/bash
 
for number in {1..100}; do
    if [ $((number%3)) -eq 0 ]; then
        echo "Fizz"
    elif [ $((number%5)) -eq 0 ]; then
        echo "Buzz"
    else
        echo $number
    fi
done
