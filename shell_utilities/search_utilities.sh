#!/bin/bash
# This code should exist in the bashrc file.


# Try to get path from environment variable (preferred)
shell_utilities_path=${SHELL_UTILITIES_PATH:-}  # Use default empty value if not set

# Check if path is set from environment variable
if [[ -z "$shell_utilities_path" ]]; then
  # If not set, check for a configuration file
  config_file="$HOME/.shell_utilities_config"
  if [[ -f "$config_file" ]]; then
    # Read path from configuration file
    shell_utilities_path=$(cat "$config_file")
  fi
fi

# Fallback to a static path if all else fails
if ! is_valid_path "$shell_utilities_path"; then
  # Replace with your default directory path
  shell_utilities_path="/path/to/default/shell_utilities"
fi

# Validate final path
if ! is_valid_path "$shell_utilities_path"; then
  echo "Error: Could not find shell_utilities folder at any defined location."
  exit 1
fi

# Include utility functions (modify filename as needed)
source "$shell_utilities_path/utility_functions.sh"

# Use the functions from the included file
greet "World"
check_file_exists "/etc/passwd"

echo "Using shell_utilities path: $shell_utilities_path"
