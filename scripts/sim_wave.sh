#!/usr/bin/bash
. config.sh

before_filepath="/tmp/before_${SIM_FILE_EXT_files_file}.txt"
after_filepath="/tmp/after_${SIM_FILE_EXT_file}.txt"

# saving waveform files before current sim
find . -maxdepth 1 -name "*.$SIM_FILE_EXT" >"$before_filepath"

sim.sh "$@"

# saving waveform files after the current sim
find . -maxdepth 1 -name "*.$SIM_FILE_EXT" >"$after_filepath"

. detect_sim_file.sh "$before_filepath" "$after_filepath"

if [ -n "$NEW_SIM_DUMP_FILE" ]; then
    gtkwave "$NEW_SIM_DUMP_FILE" $GTK_WAVE_FLAGS
fi
