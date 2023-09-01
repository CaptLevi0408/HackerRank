#!/bin/bash
# A mathmatical expression containing +,-,*,^,/ and parenthesis will be provided. Read in the expression, then evaluate it.
# Display the result rounded to 3 decimal places.

# Prompt the user to enter a mathematical expression
read -p "Enter a mathematical expression: " expression

# Evaluate the mathematical expression using 'bc' and set the scale to 4 decimal places
# The 'bc -l' command is used for more precise floating-point arithmetic.
result=$(echo "scale=4; $expression" | bc -l)

# Round the result to three decimal places using 'printf'
# "%.3f" specifies that the result should be formatted as a floating-point number with three decimal places.
rounded_result=$(printf "%.3f" $result)

# Display the rounded result to the user
echo "Result: $rounded_result"
