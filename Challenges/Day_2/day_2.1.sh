#!/bin/bash

echo "Task 2.1"

function create_backup {

    source_dir="$1"
    timestamp=$(date '+%Y-%m-%d-%H')
    backup_dir="backup_${timestamp}"

    # Explicitly create the backup directory
    mkdir -p "$backup_dir"

    # Copy only files from source_dir
    cp "$source_dir"/* "$backup_dir"

    echo "Backup created at ${backup_dir}"
}

create_backup "$1"
