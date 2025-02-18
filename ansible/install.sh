#!/bin/bash


source "../shell_utilities/detect_os.sh"



# Handle system-specific scripts (Option 1: Separate files)
if [[ "$OS" == "Linux" ]]; then
  # Run Linux specific script
  sudo apt update
  sudo apt install -y ansible

elif [[ "$OS" == "Mac" ]]; then
  # Run Mac specific script
  brew install ansible
fi  