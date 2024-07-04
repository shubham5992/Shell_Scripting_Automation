#!/bin/bash

# Function to find and kill zombie processes
kill_zombies() {
    echo "Finding and killing zombie processes..."
    # Using `ps` to list processes and `grep` to filter zombies
    ZOMBIES=$(ps aux | grep 'Z' | awk '{print $2}')
    
    # Loop through each zombie process and kill it
    for pid in $ZOMBIES
    do
        echo "Killing zombie process: $pid"
        kill -9 $pid  # Forcefully terminate the process
    done
    
    echo "Zombie processes killed."
}

# Call the function
kill_zombies
