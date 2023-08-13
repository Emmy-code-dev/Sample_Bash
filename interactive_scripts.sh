#!/bin/bash

while true; do
    # Display menu options
    echo "Select an option:"
    echo "1. List files in the current directory"
    echo "2. Create a new directory"
    echo "3. Exit"

    # Read user's choice
    read choice

    case $choice in
        1)
            echo "Listing files in the current directory:"
            ls
            ;;
        2)
            echo -n "Enter the name of the new directory: "
            read dirname
            mkdir "$dirname"
            echo "Directory '$dirname' created."
            ;;
        3)
            echo "Exiting..."
            exit 0
            ;;
        *)
            echo "Invalid option. Please choose 1, 2, or 3."
            ;;
    esac

    echo # Print a newline for separation
done
