#!/bin/bash

# Script to update and upgrade an Ubuntu server

# Check if the script is being run with root privileges
if [ "$(id -u)" -ne 0 ]; then
    echo "This script must be run with root privileges. Use sudo." >&2
    exit 1
fi

# Update package lists
echo "Updating package lists..."
apt update -y

# Upgrade installed packages
echo "Upgrading installed packages..."
apt upgrade -y

# Perform distribution upgrade (LTS to LTS)
echo "Checking for LTS release upgrade..."
if [ -x "$(command -v do-release-upgrade)" ]; then
    echo "Performing LTS release upgrade..."
    do-release-upgrade -d
else
    echo "do-release-upgrade command not found. Skipping LTS upgrade."
fi

# Clean up obsolete packages
echo "Cleaning up obsolete packages..."
apt autoremove -y
apt clean

echo "Server update and upgrade completed successfully."

# End of script

