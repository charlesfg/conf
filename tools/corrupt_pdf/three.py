# Full implementation of the PDF validation script using PyPDF2 and pdfminer.six

validate_pdf_script = '''"""
validate_pdf.py

This script checks if a PDF file is valid using multiple libraries.
It helps detect corruption or malformed files before uploading.

Usage:
    python validate_pdf.py <path_to_pdf>

The script reports:
    - Whether the file is a valid PDF based on magic number.
    - Whether it can be read using PyPDF2 and pdfminer.
    - Any error messages encountered during the process.
"""

import sys
import os

def check_magic_number(filepath):
    with open(filepath, 'rb') as f:
        magic = f.read(5)
        return magic == b"%PDF-"

def validate_with_pypdf2(filepath):
    try:
        from PyPDF2 import PdfReader
        reader = PdfReader(filepath)
        _ = reader.pages[0]  # Force reading the first page
        return True, None
    except Exception as e:
        return False, str(e)

def validate_with_pdfminer(filepath):
    try:
        from pdfminer.high_level import extract_text
        _ = extract_text(filepath, maxpages=1)
        return True, None
    except Exception as e:
        return False, str(e)

def main():
    if len(sys.argv) != 2:
        print(__doc__)
        return

    filepath = sys.argv[1]

    if not os.path.exists(filepath):
        print(f"File not found: {filepath}")
        return

    print(f"Validating: {filepath}\\n")

    magic_ok = check_magic_number(filepath)
    print(f"[Magic Number Check] {'PASS' if magic_ok else 'FAIL'}")

    pypdf_ok, pypdf_err = validate_with_pypdf2(filepath)
    print(f"[PyPDF2] {'PASS' if pypdf_ok else f'FAIL - {pypdf_err}'}")

    pdfminer_ok, pdfminer_err = validate_with_pdfminer(filepath)
    print(f"[pdfminer] {'PASS' if pdfminer_ok else f'FAIL - {pdfminer_err}'}")

    print("\\nSummary:")
    if magic_ok and pypdf_ok and pdfminer_ok:
        print("✅ This PDF passed all checks.")
    else:
        print("❌ This PDF is likely corrupted or malformed.")

if __name__ == "__main__":
    main()
'''

# Write the script to its intended file location
base_dir = "/Users/charlesgoncalves/git/conf/tools/corrupt_pdf"
validate_pdf_path = base_dir + "/validation_scripts/validate_pdf.py"
with open(validate_pdf_path, "w") as f:
    f.write(validate_pdf_script)

validate_pdf_path
