#!/bin/bash

generate_password() {
    local length="${1:-16}"  # Password length is 16 characters
    local characters="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!@#$%^&*()_-+=<>?"
    local password=""

    for i in $(seq 1 "$length"); do
        local random_index=$((RANDOM % ${#characters}))
        password="${password}${characters:$random_index:1}"
    done

    echo "$password"
}

# Enter password length from the user
read -p "Enter desired password length (default is 16): " password_length

# Generate the password
password=$(generate_password "$password_length")

echo "Generated password: $password"
