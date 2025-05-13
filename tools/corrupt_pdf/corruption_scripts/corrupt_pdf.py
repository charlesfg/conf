"""
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

def repeat_truncated_pdf(input_path, output_path, truncate_size=100000):
    with open(input_path, 'rb') as f:
        original_data = f.read()

    original_size = len(original_data)
    truncated_data = original_data[:truncate_size]

    # Calculate how many full repeats we need
    full_repeats = original_size // len(truncated_data)
    remaining_bytes = original_size % len(truncated_data)

    # Rebuild the repeated data
    new_data = truncated_data * full_repeats + truncated_data[:remaining_bytes]

    with open(output_path, 'wb') as f:
        f.write(new_data)

    print(f"Repeated-truncated PDF saved to {output_path} (size preserved: {len(new_data)} bytes)")


def truncate_pdf(input_path, output_path, truncate_size=100000):
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
        repeat_truncated_pdf(input_path, output_path)
    elif corruption_type == "flip":
        flip_bytes_pdf(input_path, output_path)
    elif corruption_type == "header":
        corrupt_header_pdf(input_path, output_path)
    else:
        print("Unknown corruption type.")
        print(__doc__)

if __name__ == "__main__":
    main()
