# Makefile for LaTeX Resume
# Usage: make (or make build) to compile, make clean to remove aux files

# Add LaTeX to PATH if MacTeX is installed
ifeq ($(shell test -d /Library/TeX/texbin && echo yes),yes)
    export PATH := /Library/TeX/texbin:$(PATH)
endif

LATEX = pdflatex
MAIN = resume
OUTPUT_DIR = output

.PHONY: all clean build view

all: build

build:
	@mkdir -p $(OUTPUT_DIR)
	@if ! command -v $(LATEX) > /dev/null 2>&1; then \
		echo "Error: pdflatex not found in PATH."; \
		echo "MacTeX is installed. Please add to your ~/.zshrc:"; \
		echo "  export PATH=\"/Library/TeX/texbin:\$$PATH\""; \
		echo "Then run: source ~/.zshrc"; \
		exit 1; \
	fi
	$(LATEX) -output-directory=$(OUTPUT_DIR) $(MAIN).tex
	$(LATEX) -output-directory=$(OUTPUT_DIR) $(MAIN).tex
	@echo "Resume compiled successfully: $(OUTPUT_DIR)/$(MAIN).pdf"

clean:
	rm -rf $(OUTPUT_DIR)
	rm -f *.aux *.log *.out *.toc *.fdb_latexmk *.fls *.synctex.gz
	@echo "Cleaned auxiliary files"

view: build
	@if command -v open > /dev/null; then \
		open $(OUTPUT_DIR)/$(MAIN).pdf; \
	elif command -v xdg-open > /dev/null; then \
		xdg-open $(OUTPUT_DIR)/$(MAIN).pdf; \
	fi

# Alternative: Use latexmk for automatic compilation
latexmk:
	latexmk -pdf -output-directory=$(OUTPUT_DIR) $(MAIN).tex
	@echo "Resume compiled with latexmk: $(OUTPUT_DIR)/$(MAIN).tex"

