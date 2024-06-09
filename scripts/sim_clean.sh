#!/usr/bin/bash
# shellcheck source=config.sh

. config.sh

for file in "$(pwd)"/*; do
    file_ext="${file##*.}"
    should_keep=false

    # skip current directory
    if [ -d "$file" ]; then
        if [ "$file" == "$USER_LIB" ]; then
            rm -r "$file"
        fi
    fi

    # check if the file's ext is on the white list
    for ext in "${WHITE_LIST_KEEP_EXTS[@]}"; do
        if [ "$file_ext" == "$ext" ]; then
            should_keep=true
            break
        fi
    done

    # delete if file's ext is snot in white list
    if [ "$should_keep" == false ]; then
        rm -r "$file"
    fi
done
