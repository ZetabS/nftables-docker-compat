# nftables-docker-compat

A simple automation toolkit for managing, backing up, restoring, and service-controlling nftables and iptables rules with Docker compatibility in mind.

## Background & Purpose

Docker uses the iptables-nft backend by default, which translates iptables commands into nftables rules. However, this approach does not provide full compatibility, and since Docker does not manage nftables rules directly, conflicts can occur with user-defined nftables rules or rules may not be applied as intended.

This project was created to safely manage nftables and iptables rules, automate backup and restore, and streamline service operations in such environments.

## How It Works with Docker

This toolkit and service simply backs up the current iptables rules, applies your nftables.conf, and then restores the iptables rules as needed. This ensures that your custom nftables and iptables rules can be safely managed even when Docker is running.

## Features

- **View/List/Validate/Apply nftables rules**

- **Backup/Restore configuration files and iptables rules**

- **Install/Uninstall/Enable/Disable nftables-iptables compatibility service**

- **Consistent automation using Taskfile**

## Usage

### Requirements

- Linux environment

- `sudo` privileges

- `nft`, `iptables`, and [`task`](https://github.com/go-task/task) commands installed

- `systemd` (optional, only required for service management)

### Main Tasks

```bash
# Show current nftables config
task show

# Validate configuration file
task validate

# Apply configuration (includes backup, save, iptables backup/restore)
task apply

# Backup current configuration
task backup

# Rollback to the latest backup
task rollback

# Specify backup file
task rollback FILE=./backup/backup-20250515-081839.nft

# Service install/uninstall/enable/disable/status
task service-install
task service-uninstall
task service-enable
task service-disable
task service-status
```

### Backup File Locations

- nftables: `backup/backup-YYYYMMDD-HHMMSS.nft`
- nftables (latest): `backup/backup-latest.nft`
- iptables: `backup/iptables.rules`

### Customization

- Main paths and variables can be modified at the top of `Taskfile.yml`.

## File Structure

```text
.task/                  # Internal folder for Taskfile state and checksum (safe to delete at any time)
backup/                 # Backup file storage folder
compat-nft.service      # systemd service file
compat-nft.sh           # Service script
nftables.conf.example   # Example nftables configuration
Taskfile.yml            # Taskfile automation script
```
