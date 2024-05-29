#!/bin/bash

OPENSCAD_COMMAND=${1:-openscad}

set -e

for dir in ./*; do
    if [ -d "$dir" ]; then
        for file in "$dir"/*.scad; do
            echo "$file"
            $OPENSCAD_COMMAND --export-format binstl -o "${file%.scad}.stl" "$file"
            $OPENSCAD_COMMAND --render --autocenter --viewall "$file" -o "$dir/preview.png"
        done
    fi
done
