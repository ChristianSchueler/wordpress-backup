# WordPress Website Backup Script

A robust backup solution for WordPress websites that automatically backs up both the MySQL database and all website files using secure connections. The script is designed to run in Windows Subsystem for Linux (WSL) environment.

## Disclaimer

I created this script, setup, repository and documentation within one hour using the Cascade AI feature of the Windsurf IDE.

## Features

- MySQL database backup using secure connection
- Website files backup via secure FTP
- Automatic ZIP archive creation with timestamp
- Configurable backup locations
- Secure credential management

## Prerequisites

- Windows 10/11 with WSL installed
- MySQL client
- wget
- zip utilities

## Installation

1. Clone the repository:
```bash
git clone git@github.com:ChristianSchueler/wordpress-backup.git
cd wordpress-backup
```

2. Run the setup script to install required dependencies:
```bash
wsl sudo ./setup.sh
```

3. Create your configuration file:
```bash
cp config.template.sh config.sh
```

4. Edit `config.sh` with your credentials:
```bash
nano config.sh
```

Configure the following variables:
- Database settings (`DB_NAME`, `DB_USER`, `DB_PASS`, `DB_HOST`)
- FTP settings (`FTP_SERVER`, `FTP_USER`, `FTP_PASS`, `FTP_DIR`)
- Backup location (`BACKUP_DIR`)

## Usage

Run the backup script:
```bash
wsl ./backup_website.sh
```

The script will:
1. Create a backup of your MySQL database
2. Download all website files via FTP
3. Create a ZIP archive with timestamp containing both database and files
4. Clean up temporary files

Backups will be stored in the configured `BACKUP_DIR` with the format: `website_backup_YYYY-MM-DD_HH-MM-SS.zip`

## Security

- The `config.sh` file containing your credentials is ignored by Git
- All connections (MySQL and FTP) are made securely
- Temporary files are automatically cleaned up after backup

## System Requirements

- Windows 10/11 with WSL enabled
- Sufficient disk space for website backup
- Network access to your web server and database
- SSH access for GitHub (optional, for development)

## Contributing

1. Fork the repository
2. Create your feature branch
3. Commit your changes
4. Push to the branch
5. Create a new Pull Request

## License

This project is licensed under the MIT License - see the LICENSE file for details.
