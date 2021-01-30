#!/usr/bin/env bash

DIRECTORY="$1"

for file in "${DIRECTORY}/"*.dircolors; do
    cat "$file"
done
