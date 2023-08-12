#!/bin/bash

# Function to add a new record
add_record() {
    echo "Enter new record details:"
    read -p "Name: " name
    read -p "Age: " age
    read -p "Email: " email

    echo "$name|$age|$email" >> records.txt
    echo "Record added successfully."
}

# Function to edit an existing record
edit_record() {
    read -p "Enter the name to edit: " search_name

    # Search for the record
    record=$(grep -i "^$search_name" records.txt)

    if [ -z "$record" ]; then
        echo "Record not found."
    else
        echo "Current record: $record"
        read -p "Enter new age: " new_age
        read -p "Enter new email: " new_email

        # Replace the existing record with the edited information
        sed -i "s/^$search_name.*$/$search_name|$new_age|$new_email/" records.txt
        echo "Record edited successfully."
    fi
}

# Function to search for a specific record
search_record() {
    read -p "Enter the name to search: " search_name

    # Search for the record
    record=$(grep -i "^$search_name" records.txt)

    if [ -z "$record" ]; then
        echo "Record not found."
    else
        echo "Record found: $record"
    fi
}

# Function to generate a report
generate_report() {
    echo "Generating report..."
    cat records.txt
}

# Main menu
while true; do
    echo "Menu:"
    echo "1. Add Record"
    echo "2. Edit Record"
    echo "3. Search Record"
    echo "4. Generate Report"
    echo "5. Exit"
    
    read -p "Enter your choice: " choice
    
    case $choice in
        1) add_record;;
        2) edit_record;;
        3) search_record;;
        4) generate_report;;
        5) exit;;
        *) echo "Invalid choice. Please try again.";;
    esac
done
