#!/usr/bin/env bash
# This challenge involves the construction of trees, in the form of ASCII Art.

# We have to deal with real world constraints, so we cannot keep repeating the 
 #pattern infinitely. So, we will provide you a number of iterations, and you need 
# to generate the ASCII version of the Fractal Tree for only those many iterations 
# (or, levels of recursion). A few samples are provided below.

# Declare an associative array called 'canvas' to represent the drawing canvas.
# 'iterations' will hold the number of iterations.
# 'width' and 'height' specify the dimensions of the canvas.
declare -A canvas
declare -i iterations
declare -i width=100
declare -i height=63

# Function to fill the canvas with underscores
fill_canvas() {
    declare -i x y
    for ((y = 0; y < height; y++)); do
        for ((x = 0; x < width; x++)); do
            canvas[$y, $x]="_"  # Fill the canvas with underscores
        done
    done
}

# Function to draw a point on the canvas
draw_point() {
    declare -i x y
    x="$1"
    y="$2"
    canvas[$y, $x]="1"  # Draw a point at coordinates (x, y)
}

# Function to draw the trunk of the fractal tree
draw_trunk() {
    declare -i iteration trunk_height x0 y y0
    x0="$1"
    y0="$2"
    iteration="$3"
    ((iteration == iterations)) && return  # Stop if the maximum iteration is reached
    trunk_height=$((2 ** (4 - iteration)))

    for ((y = y0; y > y0 - trunk_height; y--)); do
        draw_point "$x0" "$y"  # Draw the trunk of the tree
    done

    draw_branches "$x0" $((y0 - trunk_height)) $iteration  # Draw branches
}

# Function to draw branches of the fractal tree
draw_branches() {
    declare -i branch_height d iteration x x0 y y0
    x0="$1"
    y0="$2"
    iteration="$3"
    branch_height=$((2 ** (4 - iteration)))

    for ((d = 1, y = y0; d <= branch_height; d++, y--)); do
        draw_point $((x0 - d)) "$y"  # Draw branches on the left side
        draw_point $((x0 + d)) "$y"  # Draw branches on the right side
    done

    draw_trunk $((x0 - branch_height)) $((y0 - branch_height)) $((iteration + 1))  # Draw trunk and branches recursively
    draw_trunk $((x0 + branch_height)) $((y0 - branch_height)) $((iteration + 1))  # Draw trunk and branches recursively
}

# Function to draw the entire fractal tree
draw_tree() {
    fill_canvas  # Fill the canvas with underscores
    draw_trunk $((width / 2 - 1)) $((height - 1)) 0  # Start drawing the trunk
}

# Function to display the canvas
show_canvas() {
    declare -i x y
    for ((y = 0; y < height; y++)); do
        for ((x = 0; x < width; x++)); do
            printf '%s' "${canvas[$y, $x]}"  # Display the canvas content
        done
        echo  # Move to the next line
    done
}

# Main function
main() {
    read -r iterations  # Read the number of iterations from the user
    draw_tree  # Draw the fractal tree
    show_canvas  # Display the canvas with the tree
}

# Call the main function with command-line arguments
main "$@"
