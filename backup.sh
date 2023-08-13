#!/bin/bash

# Define variables
backup_dir="/path/to/backup/directory"  # Change this to your desired backup directory
file_to_backup="/path/to/personal/file"  # Change this to the path of the file you want to backup
timestamp=$(date +"%Y%m%d%H%M%S")

# Create backup directory if it doesn't exist
if [ ! -d "$backup_dir" ]; then
    mkdir -p "$backup_dir"
fi

# Create timestamped backup folder
backup_folder="$backup_dir/backup_$timestamp"
mkdir "$backup_folder"

# Copy the file to the backup folder
cp "$file_to_backup" "$backup_folder"

# Display success message
echo "Backup of $file_to_backup created in $backup_folder"
