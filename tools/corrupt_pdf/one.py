import os
import zipfile

# Create folder structure for the tutorial
base_dir = "/Users/charlesgoncalves/git/conf/tools/corrupt_pdf"
os.makedirs(base_dir, exist_ok=True)

folders = [
    "corruption_scripts",
    "validation_scripts",
    "tests",
    "notebooks",
    "setup"
]

for folder in folders:
    os.makedirs(os.path.join(base_dir, folder), exist_ok=True)

# Create placeholder files for each section
files = {
    "corruption_scripts/corrupt_pdf.py": "",
    "validation_scripts/validate_pdf.py": "",
    "tests/test_all.py": "",
    "notebooks/pdf_validation_tutorial.ipynb": "",
    "setup/requirements.txt": "PyPDF2\npdfminer.six\njupyter\nipykernel\n",
    "setup/setup_instructions.txt": """
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
""",
}

# Write empty placeholder content to the structure
for path, content in files.items():
    full_path = os.path.join(base_dir, path)
    with open(full_path, "w") as f:
        f.write(content)

# Zip the entire tutorial folder for download
zip_path = base_dir + ".zip"
with zipfile.ZipFile(zip_path, "w", zipfile.ZIP_DEFLATED) as zipf:
    for root, dirs, files in os.walk(base_dir):
        for file in files:
            file_path = os.path.join(root, file)
            zipf.write(file_path, os.path.relpath(file_path, base_dir))

zip_path
