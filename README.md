# My Resume Builder

My personal LaTeX-based resume builder. Modular setup for easy updates.

## Project Structure

```text
my-resume/
├── resume.tex              # Main LaTeX document
├── content/                 # Modular content files
│   ├── personal_info.tex   # Personal information
│   ├── experience.tex      # Work experience
│   ├── education.tex       # Educational background
│   ├── skills.tex          # Technical skills
│   ├── projects.tex        # Notable projects
│   └── certifications.tex  # Certifications and awards
├── Makefile                # Build automation
└── output/                 # Generated PDF (created on build)
```

## Setup

### macOS

**Option 1: BasicTeX (Recommended - Smaller, ~100MB)**

```bash
brew install --cask basictex
# Add to PATH (add to ~/.zshrc):
export PATH="/Library/TeX/texbin:$PATH"
```

After installation, install the ModernCV package:

```bash
sudo tlmgr update --self
sudo tlmgr install moderncv
```

**Option 2: MacTeX (Full installation, ~4GB)**

```bash
brew install --cask mactex
```

### Linux

```bash
sudo apt-get install texlive-full  # Ubuntu/Debian
```

## Usage

### Build the Resume

```bash
# Compile the resume
make build

# Or use pdflatex directly
pdflatex -output-directory=output resume.tex
pdflatex -output-directory=output resume.tex  # Run twice for references
```

### View the Generated PDF

```bash
make view
```

### Clean Auxiliary Files

```bash
make clean
```

## Editing My Resume

1. **Personal Information**: Edit `content/personal_info.tex`
   - Update name, contact info, social links

2. **Experience**: Edit `content/experience.tex`
   - Add/remove `\cventry` blocks for each position
   - Format: `\cventry{Date}{Title}{Company}{Location}{}{Description}`

3. **Education**: Edit `content/education.tex`
   - Add degrees and educational achievements

4. **Skills**: Edit `content/skills.tex`
   - Use `\cvdoubleitem` for two-column skill listings

5. **Projects**: Edit `content/projects.tex`
   - Add notable projects with descriptions

6. **Certifications**: Edit `content/certifications.tex`
   - Add certifications, awards, or honors

## Customization

### Change Theme/Color

Edit `resume.tex`:

- **Style**: Change `\moderncvstyle{classic}` to `casual`, `banking`, `oldstyle`, or `fancy`
- **Color**: Change `\moderncvcolor{blue}` to `orange`, `green`, `red`, `purple`, `grey`, or `black`

### Add/Remove Sections

- Comment out unwanted sections in `resume.tex` using `%`
- Create new section files in `content/` and include them with `\input{content/filename.tex}`

## Notes

- Run `pdflatex` twice to ensure all references and citations are resolved
- Use `make clean` before committing to avoid including auxiliary files
- Uses [ModernCV](https://github.com/xdanaux/moderncv) class
