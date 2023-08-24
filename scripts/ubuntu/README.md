# Ubuntu-Specific Scripts

This directory contains scripts tailored for Ubuntu servers. These scripts automate various tasks and configurations specific to Ubuntu.

## Scripts

### 1. 'update_upgrade_server.sh'

Description: Ubuntu Server Update and Upgrade Script

This script is designed to update and upgrade an Ubuntu server. It performs the following tasks:

- Updates package lists to retrieve the latest package information from repositories.
- Upgrades installed packages to their latest versions.
- Checks for and performs a distribution upgrade if an LTS (Long Term Support) release is available.
- Cleans up obsolete packages to free up disk space.

## Usage

1. Ensure you are logged in as a user with sudo privileges.

2. Clone this repository to your server or copy the script to your server using your preferred method.

```bash
  git clone https://github.com/eregbene/Ubuntu-CentOS-DevOps-Scripts.git
```
 **Important Notes**:

   - **Use with Caution**: This script should be used with caution, especially on production servers. It's essential to exercise caution and test thoroughly in non-production environments before applying updates to critical systems.
   
   - **Distribution Upgrade**: Be aware that upgrading to a new LTS release may prompt you with questions during the upgrade process. Carefully review and answer them as needed.

   - **Backup and Rollback**: Regularly updating and upgrading your server is a best practice for security and stability. However, always ensure you have appropriate backups and a rollback plan for critical systems.

Please refer to the individual script files for usage instructions and details.

