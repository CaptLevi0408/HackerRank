#!/bin/bash
# Read in one character from STDIN.
# If the character is 'Y' or 'y' display "YES".
# If the character is 'N' or 'n' display "NO".

read y

if [[ $y == Y || $y == y ]]; then
    echo YES
else
    echo NO
fi
