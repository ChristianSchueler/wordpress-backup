#!/bin/bash

# Check if config file exists
if [ ! -f "./config.sh" ]; then
    echo "Error: config.sh not found!"
    echo "Please copy config.template.sh to config.sh and update the credentials."
    exit 1
fi

# Source the configuration file
source ./config.sh

echo "Starting website backup..."

echo "creating backup directory...", $BACKUP_DIR

# Create backup directory if it doesn't exist
mkdir -p $BACKUP_DIR

echo "Dumping database..."

# Step 1: Dump the MySQL database
mysqldump -u $DB_USER -p$DB_PASS -h $DB_HOST $DB_NAME > $BACKUP_DIR/db_backup.sql

echo "Downloading website files from" $FTP_SERVER$FTP_DIR "to" "$BACKUP_DIR/website_files/..."

# Step 2: Download all files using secure FTP
wget -nH --cut-dirs=1 --no-parent -q --show-progress --progress=bar -r --user=$FTP_USER --password=$FTP_PASS ftp://$FTP_SERVER$FTP_DIR/ -P $BACKUP_DIR/website_files/

echo "Creating backup zip file..."

# Step 3: Create a zip file from all files and the database
zip -r $BACKUP_DIR/website_backup_$(date +"%Y-%m-%d_%H-%M-%S").zip $BACKUP_DIR/db_backup.sql $BACKUP_DIR/website_files/

# Clean up
rm -rf $BACKUP_DIR/website_files/*

echo "Backup completed successfully!"
