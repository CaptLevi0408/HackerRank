#!/bin/bash
# Given three integers (X,Y, and Z) representing the three sides of a triangle, identify whether the triangle is scalene, isosceles,
# or equilateral.
# The "-p" is not needed, "-p" makes the prompt more user friendly.

read -p "Enter the value for side A: " A
read -p "Enter the value for side B: " B
read -p "Enter the value for side C: " C

# Check if it's an equilateral triangle
if [ "$A" -eq "$B" ] && [ "$B" -eq "$C" ]; then
    echo EQUILATERAL
# Check if it's an isosceles triangle
elif [ "$A" -eq "$B" ] || [ "$B" -eq "$C" ] || [ "$A" -eq "$C" ]; then
    echo ISOSCELES
# If neither equilateral nor isosceles, it's scalene
else
    echo SCALENE
fi
