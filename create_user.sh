#!/bin/bash

# Check if the script is run with sudo privileges
if [[ $EUID -ne 0 ]]; then
  echo "This script requires sudo privileges. Please run it with sudo."
  exit 1
fi

# Get username from user input
read -p "Enter username: " username

# Validate username input
if [[ -z "$username" ]]; then
  echo "Username cannot be empty."
  exit 1
fi

# Prompt for password (optional)
read -sp "Enter password for user $username (optional): " password

# Create the user with the provided username
sudo useradd -m -s /bin/bash "$username"

# Check if user creation was successful
if [[ $? -eq 0 ]]; then
  echo "User $username created successfully!"
else
  echo "Failed to create user $username."
  exit 1
fi

# Optionally, set a password for the user (if not provided earlier)
if [[ -z "$password" ]]; then
  echo "No password provided. Skipping password setting."
else
  # Alternative approach for password setting (assuming 'passwd' doesn't support --stdin)
  echo "Setting password for $username using 'sudo passwd'."
  sudo passwd "$username"
  echo "Enter password again to confirm for user $username."
fi

exit 0

