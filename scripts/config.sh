#!/usr/bin/bash

# modelsim related configs
readonly USER_LIB="user_lib"
WHITE_LIST_KEEP_EXTS=("sv" "v")
NEW_SIM_DUMP_FILE=

# gtkwave related configs
readonly SIM_FILE_EXT="vcd"
readonly NUM_CPU_CORES=12
readonly GTK_WAVE_FLAGS="--slider-zoom --fastload --optimize --cpu=$NUM_CPU_CORES"
