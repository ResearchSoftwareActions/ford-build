#!/bin/bash
set -e

# Find FORD project file, name is given by $1
ROOT=$(find . -name $1 -exec dirname {} \;)
echo "FORD project file located in ${ROOT}"

# Get output directory, where documentation is written
# This can later be used for publishing
OUTPUT_DIR=$(grep 'output_dir' ${ROOT}/$1 | sed 's/output_dir: \(.*\)/\1/')
OUTPUT_DIR="${ROOT}/${OUTPUT_DIR}"
echo "Documentation written to ${OUTPUT_DIR}"
# Set output directory variable
echo ::set-output name=output_dir::$OUTPUT_DIR

# Build documentation
echo "Building documenation"
ford ${ROOT}/$1
