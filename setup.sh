#!/bin/bash

echo "Starting setup of backup script dependencies..."

# Update package lists
echo "Updating package lists..."
sudo apt-get update

# Install required packages
echo "Installing required packages..."
PACKAGES=(
    "mysql-client"    # For mysqldump command
    "wget"           # For downloading files
    "zip"            # For creating zip archives
)

for package in "${PACKAGES[@]}"; do
    if ! command -v $package &> /dev/null; then
        echo "Installing $package..."
        sudo apt-get install -y $package
    else
        echo "$package is already installed"
    fi
done

# Verify installations
echo -e "\nVerifying installations..."
echo "Installed versions:"
mysql --version
wget --version | head -n 1
zip --version | head -n 1

echo -e "\nSetup completed successfully!"
echo "You can now run the backup script using: ./backup_website.sh"

# Make the backup script executable
if [ -f "./backup_website.sh" ]; then
    chmod +x ./backup_website.sh
    echo "Made backup_website.sh executable"
fi
