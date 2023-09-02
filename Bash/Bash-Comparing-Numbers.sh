#!/bin/bash
# Given two integers, X and Y, identify whether X < Y or X > Y or X = Y

read x
read y

if [[ $x -lt $y ]]; then
    echo X is less than Y
elif [[ $x -gt $y ]]; then
    echo X is greater than Y
elif [[ $x -eq $y ]]; then
    echo X is equal to Y
fi