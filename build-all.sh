#!/bin/bash

set -e

for dir in ./*; do
    if [ -d "$dir" ]; then
        for file in "$dir"/*.scad; do
            echo "$file"
            openscad --export-format binstl -o "${file%.scad}.stl" "$file"
            openscad --render --autocenter --viewall "$file" -o "$dir/preview.png"
        done
    fi
done
