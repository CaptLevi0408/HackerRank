#!/bin/bash
# Given N integers, compute their average, rounded to three decimal places
# The first line contains an integer, N
# Each of the following N lines contains a single integer
# Display the average of the N integers, rounded off to three decimal places

# Prompt the user for the number of integers they want to enter
read -p "Enter the number of integers: " integers

# Initialize variables for the sum and count
sum=0
count=0

# Use a for loop to iterate for the specified number of integers
for ((i=1; i<=$integers; i++)); do
    # Prompt the user to enter an integer and store it in the 'num' variable
    read -p "Enter integer $i: " num

    # Add the entered integer to the running sum
    sum=$((sum + num))

    # Increment the count to keep track of how many integers have been entered
    count=$((count + 1))
done

# Check if any integers were entered (count > 0)
if [ $count -gt 0 ]; then

    # Calculate the average by dividing the sum by the count
    # The 'bc -l' command is used for floating-point arithmetic with the specified scale
    average=$(bc -l <<< "scale=6; $sum / $count")
else
    # If no integers were entered, set the average to 0
    average=0
fi

# I was only able to get this solution to work by adding "%.3f"
rounded_average=$(printf "%.3f" $average)

# Display the calculated average to the user
echo $rounded_average
