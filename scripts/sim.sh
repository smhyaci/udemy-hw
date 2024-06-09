#!/usr/bin/bash

. config.sh

MIN_NUM_ARGS=1

# clean folder of *.vcd files
sim_clean.sh

# check that correct args are passed
if [ "$#" -lt $MIN_NUM_ARGS ]; then
    echo "Usage: $0 <file_1.sv> [<file_2.sv> ... <file_N.sv>]"
    exit 1
fi

top_lvl_no_ext=${1%.*}
top_lvl_filename=$(basename "$top_lvl_no_ext")

# confirm all files are .sv files (vlog won't run with mix of *.sv and *.v files)
for file in "$@"; do
    if [[ "$file" != *.sv ]]; then
        echo "Usage: $0 does only takes files of extentsion type *.sv"
        exit 1
    fi
done

# captures error output (if any) and displays that
silent_run() {
    output=$("$@" 2>&1)
    if [ $? -ne 0 ]; then
        echo "$output"
        exit 1
    fi
}

# run commands to setup Modelsim project
silent_run vlib.exe "$USER_LIB"
silent_run vmap.exe work "$USER_LIB"
silent_run vlog.exe "$@"

# not silent because vsim might display testbench data
vsim.exe "$USER_LIB"."$top_lvl_filename" -c -do "run -all; exit"

