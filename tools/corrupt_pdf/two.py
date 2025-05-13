# Full implementation of the PDF corruption script with helper and comments

corrupt_pdf_script = '''"""
corrupt_pdf.py

This script provides different ways to corrupt a PDF file for testing purposes.

Usage:
    python corrupt_pdf.py <path_to_pdf> <corruption_type> <output_path>

Corruption Types:
    - truncate: Cuts off the file after a random or fixed number of bytes.
    - flip: Flips random bytes in the file.
    - header: Corrupts the PDF header to make it unreadable.

Example:
    python corrupt_pdf.py sample.pdf truncate corrupted_sample.pdf
"""

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
    data[0:5] = b'%XXX-'  # Invalid header
    with open(output_path, 'wb') as f:
        f.write(data)
    print(f"PDF with corrupted header saved to {output_path}")

def main():
    if len(sys.argv) != 4:
        print(__doc__)
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
        print(__doc__)

if __name__ == "__main__":
    main()
'''

# Write the script to its intended file location
base_dir = "/Users/charlesgoncalves/git/conf/tools/corrupt_pdf"
corrupt_pdf_path = base_dir + "/corruption_scripts/corrupt_pdf.py"
with open(corrupt_pdf_path, "w") as f:
    f.write(corrupt_pdf_script)

corrupt_pdf_path
