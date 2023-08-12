#!/bin/bash

# Initialize an empty array to store records
declare -a records

# Function to add a new record
add_record() {
    echo "Adding a new record:"
    read -p "Name: " name
    read -p "Phone Number: " phone
    read -p "Email: " email

    records+=("$name,$phone,$email")
    echo "Record added successfully!"
}

# Function to edit an existing record
edit_record() {
    echo "Editing an existing record:"
    read -p "Enter the name of the record to edit: " search_name

    for ((i = 0; i < ${#records[@]}; i++)); do
        IFS=',' read -ra record <<< "${records[$i]}"
        if [[ "${record[0]}" == "$search_name" ]]; then
            read -p "New Phone Number: " new_phone
            read -p "New Email: " new_email

            records[$i]="${record[0]},$new_phone,$new_email"
            echo "Record edited successfully!"
            return
        fi
    done

    echo "Record not found."
}

# Function to search for a specific record
search_record() {
    echo "Searching for a record:"
    read -p "Enter the name to search for: " search_name

    for record in "${records[@]}"; do
        IFS=',' read -ra fields <<< "$record"
        if [[ "${fields[0]}" == "$search_name" ]]; then
            echo "Name: ${fields[0]}"
            echo "Phone Number: ${fields[1]}"
            echo "Email: ${fields[2]}"
            return
        fi
    done

    echo "Record not found."
}

# Function to generate a report of all records
generate_report() {
    echo "Generating Report:"
    for record in "${records[@]}"; do
        IFS=',' read -ra fields <<< "$record"
        echo "Name: ${fields[0]}"
        echo "Phone Number: ${fields[1]}"
        echo "Email: ${fields[2]}"
        echo "---------------------------"
    done
}

# Main menu
while true; do
    echo "Interactive Menu"
    echo "1. Add New Record"
    echo "2. Edit Existing Record"
    echo "3. Search Specific Record"
    echo "4. Generate Report"
    echo "5. Exit"
    read -p "Select an option: " choice

    case $choice in
        1) add_record ;;
        2) edit_record ;;
        3) search_record ;;
        4) generate_report ;;
        5) echo "Goodbye!"; exit ;;
        *) echo "Invalid choice. Please select again." ;;
    esac
done
