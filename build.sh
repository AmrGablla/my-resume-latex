#!/bin/bash

# Build script for LaTeX Resume
# Alternative to Makefile - run with: ./build.sh

MAIN="resume"
OUTPUT_DIR="output"

# Add LaTeX to PATH if not already there (for MacTeX)
if [ -d "/Library/TeX/texbin" ]; then
    export PATH="/Library/TeX/texbin:$PATH"
fi

# Check if pdflatex is available
if ! command -v pdflatex &> /dev/null; then
    echo "✗ Error: pdflatex not found!"
    echo ""
    echo "MacTeX appears to be installed, but pdflatex is not in PATH."
    echo ""
    echo "Please add LaTeX to your PATH permanently by adding this to ~/.zshrc:"
    echo "    export PATH=\"/Library/TeX/texbin:\$PATH\""
    echo ""
    echo "Then run: source ~/.zshrc"
    echo ""
    echo "Or run this script with:"
    echo "    export PATH=\"/Library/TeX/texbin:\$PATH\" && ./build.sh"
    echo ""
    exit 1
fi

# Create output directory if it doesn't exist
mkdir -p "$OUTPUT_DIR"

# Compile LaTeX (run twice for references)
echo "Compiling resume..."
pdflatex -output-directory="$OUTPUT_DIR" "$MAIN.tex" > /dev/null 2>&1
pdflatex -output-directory="$OUTPUT_DIR" "$MAIN.tex"

# Check if compilation was successful
if [ -f "$OUTPUT_DIR/$MAIN.pdf" ]; then
    echo "✓ Resume compiled successfully: $OUTPUT_DIR/$MAIN.pdf"
    
    # Open PDF if on macOS
    if [[ "$OSTYPE" == "darwin"* ]]; then
        open "$OUTPUT_DIR/$MAIN.pdf"
    fi
else
    echo "✗ Compilation failed. Check the log files in $OUTPUT_DIR/"
    echo "  Run with verbose output: pdflatex -output-directory=$OUTPUT_DIR $MAIN.tex"
    exit 1
fi

