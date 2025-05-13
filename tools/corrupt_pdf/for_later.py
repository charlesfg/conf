# Full implementation of the testing script that runs both corruption and validation processes

test_all_script = '''"""
test_all.py

This script tests the full pipeline:
1. Corrupts a sample PDF in different ways.
2. Validates the corrupted PDFs using the validation script.
3. Prints a report of the results.

Usage:
    python test_all.py <path_to_sample_pdf>
"""

import os
import subprocess
import sys

CORRUPT_SCRIPT = os.path.join("..", "corruption_scripts", "corrupt_pdf.py")
VALIDATE_SCRIPT = os.path.join("..", "validation_scripts", "validate_pdf.py")
OUTPUT_DIR = "output"

def run_command(cmd):
    result = subprocess.run(cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True)
    return result.stdout + result.stderr

def main():
    if len(sys.argv) != 2:
        print(__doc__)
        return

    input_pdf = sys.argv[1]
    os.makedirs(OUTPUT_DIR, exist_ok=True)

    corruptions = {
        "truncate": os.path.join(OUTPUT_DIR, "truncated.pdf"),
        "flip": os.path.join(OUTPUT_DIR, "flipped.pdf"),
        "header": os.path.join(OUTPUT_DIR, "header_corrupt.pdf")
    }

    # Step 1: Corrupt the PDF in multiple ways
    print("=== Corrupting PDF ===")
    for ctype, output_file in corruptions.items():
        print(f"\n[Corruption: {ctype}]")
        cmd = ["python", CORRUPT_SCRIPT, input_pdf, ctype, output_file]
        output = run_command(cmd)
        print(output)

    # Step 2: Validate each corrupted PDF
    print("\\n=== Validating Corrupted PDFs ===")
    for ctype, file_path in corruptions.items():
        print(f"\n[Validation: {ctype}]")
        cmd = ["python", VALIDATE_SCRIPT, file_path]
        output = run_command(cmd)
        print(output)

if __name__ == "__main__":
    main()
'''

# Write the test script to the intended path
test_all_path = "/mnt/data/pdf_validation_tutorial/tests/test_all.py"
with open(test_all_path, "w") as f:
    f.write(test_all_script)

test_all_path
