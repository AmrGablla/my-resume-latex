#!/bin/bash

# Quick setup script to add LaTeX to PATH
# Run: source setup-path.sh

if [ -d "/Library/TeX/texbin" ]; then
    export PATH="/Library/TeX/texbin:$PATH"
    echo "✓ LaTeX added to PATH for this session"
    echo ""
    echo "To make this permanent, add this line to your ~/.zshrc:"
    echo "  export PATH=\"/Library/TeX/texbin:\$PATH\""
    echo ""
    echo "Then run: source ~/.zshrc"
else
    echo "✗ LaTeX not found at /Library/TeX/texbin"
    echo "  MacTeX may not be installed or is in a different location"
fi

