#!/bin/bash

# Check if the script is run as root or with sudo
if [ "$EUID" -ne 0 ]; then
  echo "Please run this script as root or with sudo."
  exit 1
fi

# Determine the Linux distribution
if [ -f /etc/centos-release ]; then
  OS="CentOS"
elif [ -f /etc/lsb-release ]; then
  OS="Ubuntu"
else
  echo "Unsupported OS. This script supports CentOS and Ubuntu."
  exit 1
fi

# Display the OS
echo "Detected OS: $OS"

# Create a new user
read -p "Enter the new username: " USERNAME
read -s -p "Enter the password for $USERNAME: " PASSWORD

# Create the user and set the password
useradd -m -s /bin/bash "$USERNAME"
echo "$USERNAME:$PASSWORD" | chpasswd

# Disable SSH access for root
if [ "$OS" == "CentOS" ]; then
  sed -i 's/PermitRootLogin yes/PermitRootLogin no/g' /etc/ssh/sshd_config
  systemctl restart sshd
elif [ "$OS" == "Ubuntu" ]; then
  sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin no/g' /etc/ssh/sshd_config
  systemctl restart ssh
fi

echo "User $USERNAME has been created with a password, and SSH access for root has been disabled."

