#!/bin/bash

# Function to print usage instructions
usage() {
    echo "Usage: $0 <directory_name> [--git]" 1>&2
    exit 1
}

# Check if at least one argument is provided
if [ $# -lt 1 ]; then
    usage
fi

# Parse command-line arguments
directory="$1"
git_init=false

# Check for --git flag
if [ "$2" = "--git" ]; then
    git_init=true
fi

# Function to create directory and change to it
create_directory() {
    if [ -d "$1" ]; then
        echo "Directory '$1' already exists."
    else
        mkdir "$1" && cd "$1" || { echo "Error creating directory '$1'."; exit 1; }
        echo "Directory '$1' created."
    fi
}

# Function to initialize Git repository
init_git_repo() {
    if git init &> /dev/null; then
        echo "Git repository initialized."
    else
        echo "Failed to initialize git repository."
    fi
}

# Main logic
create_directory "$directory"

if [ "$git_init" = true ]; then
    init_git_repo
fi
