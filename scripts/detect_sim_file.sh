#!/usr/bin/bash
. config.sh

# Check for correct usuage
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <before_sim_files.txt> <after_sim_files.txt>"
    exit 1
fi

before_file=$1
after_file=$2

# Check that the input files exist
if [ ! -f "$before_file" ]; then
    echo "Error: File $before_file not found!"
    exit 1
fi

if [ ! -f "$after_file" ]; then
    echo "Error: File $after_file not found!"
    exit 1
fi


# Get the list of sim files after running the commands
find . -maxdepth 1 -name "*.$SIM_FILE_EXT" > "$after_file"

# Find the difference between the two lists to detect new files
new_sim_file=$(comm -13 <(sort "$before_file") <(sort "$after_file"))

if [ -n "$new_sim_file" ]; then
    NEW_SIM_DUMP_FILE="$(basename "$new_sim_file")"
    export NEW_SIM_DUMP_FILE
else
    echo "No waveforms detected. No *.$SIM_FILE_EXT files were generated."
    exit 1
fi
