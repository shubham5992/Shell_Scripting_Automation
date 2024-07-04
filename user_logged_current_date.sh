#!/bin/bash

# Set where the output will be saved
output_file="/path/to/output/file.txt"

# Get today's date
current_date=$(date +"%Y-%m-%d")

# Find users logged in today and save the list to the output file
last | grep "$current_date" > "$output_file"

# Print a message to say where the list was saved
echo "List of users logged in on $current_date written to: $output_file"
