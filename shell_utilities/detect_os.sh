#!/bin/bash

# Detect OS using uname and keywords
OS=""
unameOut=$(uname -a)
case "${unameOut}" in
  *Microsoft*) OS="WSL";;
  *microsoft*) OS="WSL2";;  # Check for WSL2 specifically
  Linux*) OS="Linux";;
  Darwin*) OS="Mac";;
  CYGWIN*) OS="Cygwin";;
  MINGW*) OS="Windows";;
  Msys*) OS="Windows";;
  *) OS="UNKNOWN:${unameOut}" ;;
esac

# Print detected OS
echo "Detected OS: $OS"

# Handle system-specific scripts (Option 1: Separate files)
if [[ "$OS" == "Linux" ]]; then
  # Run Linux specific script
  source /path/to/linux_script.sh
elif [[ "$OS" == "Mac" ]]; then
  # Run Mac specific script
  source /path/to/mac_script.sh
fi

# Handle system-specific scripts (Option 2: Functions)
function linux_specific_task() {
  # Code specific to Linux
  echo "Running Linux specific task"
}

function mac_specific_task() {
  # Code specific to Mac
  echo "Running Mac specific task"
}

if [[ "$OS" == "Linux" ]]; then
  linux_specific_task
elif [[ "$OS" == "Mac" ]]; then
  mac_specific_task
fi

# Design suggestions:

# 1. Separate files:
* Maintain separate script files for each OS (e.g., linux_script.sh, mac_script.sh).
* The main script detects the OS and sources the specific script.
* Advantage: Easier code organization and maintenance for complex tasks.
* Disadvantage: Requires managing multiple files.

# 2. Functions:
* Define functions for each system-specific task within the main script.
* Conditional statements call the appropriate function based on the OS.
* Advantage: Cleaner main script, avoids managing multiple files.
* Disadvantage: Might become cluttered for many system-specific tasks.

# Choose the design that best suits your script's complexity and preference.



sudo apt update
sudo apt install -y ansible
