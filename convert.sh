#!/bin/bash

# Check if input file is provided
if [ $# -eq 0 ]; then
    echo "Usage: $0 <input-markdown-file> [output-html-file]"
    echo "Example: $0 ~/notes/blog/article.md posts/article.html"
    exit 1
fi

# Get input file
INPUT_FILE="$1"

# Check if input file exists
if [ ! -f "$INPUT_FILE" ]; then
    echo "Error: Input file '$INPUT_FILE' does not exist"
    exit 1
fi

# Determine output file
if [ $# -ge 2 ]; then
    # Use provided output filename
    OUTPUT_FILE="$2"
else
    # Generate output filename from input
    BASENAME=$(basename "$INPUT_FILE" .md)
    OUTPUT_FILE="./posts/${BASENAME}.html"
fi

# Create output directory if it doesn't exist
OUTPUT_DIR=$(dirname "$OUTPUT_FILE")
mkdir -p "$OUTPUT_DIR"

# Run pandoc
echo "Converting: $INPUT_FILE -> $OUTPUT_FILE"
pandoc \
  --from markdown \
  --to html5 \
  --standalone \
  --syntax-highlighting=none \
  --variable css=style.css \
  --data-dir ./pandoc/ \
  --embed-resources \
  --mathml \
  --output "$OUTPUT_FILE" \
  "$INPUT_FILE"

# Check if pandoc succeeded
if [ $? -eq 0 ]; then
    echo "Success! HTML file created at: $OUTPUT_FILE"
else
    echo "Error: Pandoc conversion failed"
    exit 1
fi

