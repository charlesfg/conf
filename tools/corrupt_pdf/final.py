# Properly escape the entire script again using only single quotes inside the heredoc
script_path_final = "/mnt/data/bootstrap_pdf_validation.sh"

script_content = r"""#!/bin/bash

# PDF Validation Tutorial Bootstrap Script

PROJECT_DIR="pdf_validation_tutorial"

echo "📁 Creating project directory structure..."
mkdir -p $PROJECT_DIR/{corruption_scripts,validation_scripts,tests,notebooks,setup}

# requirements.txt
cat <<EOF > $PROJECT_DIR/setup/requirements.txt
PyPDF2
pdfminer.six
jupyter
ipykernel
EOF

# setup_instructions.txt
cat <<EOF > $PROJECT_DIR/setup/setup_instructions.txt
# Setup Instructions for PDF Validation Tutorial

1. Create a virtual environment:
   python -m venv venv

2. Activate the environment:
   - Windows: venv\\Scripts\\activate
   - macOS/Linux: source venv/bin/activate

3. Install dependencies:
   pip install -r setup/requirements.txt

4. Start Jupyter Notebook:
   jupyter notebook
EOF

# corrupt_pdf.py
cat <<'EOF' > $PROJECT_DIR/corruption_scripts/corrupt_pdf.py
import sys
import random

def truncate_pdf(input_path, output_path, truncate_size=1000):
    with open(input_path, 'rb') as f:
        data = f.read()
    with open(output_path, 'wb') as f:
        f.write(data[:truncate_size])
    print(f"Truncated PDF saved to {output_path}")

def flip_bytes_pdf(input_path, output_path, num_bytes=20):
    with open(input_path, 'rb') as f:
        data = bytearray(f.read())
    for _ in range(num_bytes):
        index = random.randint(0, len(data) - 1)
        data[index] = random.randint(0, 255)
    with open(output_path, 'wb') as f:
        f.write(data)
    print(f"PDF with flipped bytes saved to {output_path}")

def corrupt_header_pdf(input_path, output_path):
    with open(input_path, 'rb') as f:
        data = bytearray(f.read())
    data[0:5] = b'%XXX-'  # Corrupt header
    with open(output_path, 'wb') as f:
        f.write(data)
    print(f"PDF with corrupted header saved to {output_path}")

def main():
    if len(sys.argv) != 4:
        print("Usage: python corrupt_pdf.py <input> <type> <output>")
        return

    input_path = sys.argv[1]
    corruption_type = sys.argv[2]
    output_path = sys.argv[3]

    if corruption_type == "truncate":
        truncate_pdf(input_path, output_path)
    elif corruption_type == "flip":
        flip_bytes_pdf(input_path, output_path)
    elif corruption_type == "header":
        corrupt_header_pdf(input_path, output_path)
    else:
        print("Unknown corruption type.")

if __name__ == "__main__":
    main()
EOF

# README.md
cat <<'EOF' > $PROJECT_DIR/README.md
# 🧪 PDF Corruption and Validation Tutorial

This tutorial teaches how to detect and handle corrupted PDF files using Python.

## 📦 Quick Start

Run this one-liner to generate the project:

```bash
curl -sSL <SCRIPT_URL> | bash
