q2.#!/bin/bash

# Check if the number of arguments is exactly 1
if [ "$#" -ne 1 ]; then
    echo "Error: Please provide exactly one command line argument."
    exit 1
fi

# Check if the argument is a file or directory
if [ ! -e "$1" ]; then
    echo "Error: The file or directory does not exist."
    exit 1
elif [ -f "$1" ]; then
    # Display the access permissions, size, and last modification time of the file
    echo "Access permissions: $(stat -c '%A' "$1")"
    echo "Size: $(stat -c '%s bytes' "$1")"
    echo "Last modification time: $(stat -c '%y' "$1")"
elif [ -d "$1" ]; then
    # Display the number of files and subdirectories in the directory
    num_files=$(find "$1" -type f | wc -l)
    num_dirs=$(find "$1" -type d | wc -l)
    echo "Number of files: $num_files"
    echo "Number of subdirectories: $(( num_dirs - 1 ))"
fi
