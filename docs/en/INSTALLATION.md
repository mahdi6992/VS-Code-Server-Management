# Installation Guide

This document provides detailed instructions for installing VS Code Server using our management script.

## Prerequisites

Before you begin, make sure you have:

1. A Linux server running Debian/Ubuntu
2. Root or sudo access to the server
3. A domain name pointing to your server's IP address (optional)
4. Basic knowledge of command line operations

## Step-by-Step Installation

### 1. Download the Script

```bash
git clone https://github.com/mahdi6992/VS-Code-Server-Management.git
cd VS-Code-Server-Management
chmod +x "VS-Code-Server-Management.sh"
```

### 2. Run the Installation Script

```bash
./VS-Code-Server-Management.sh
```

### 3. Choose Installation Option

From the menu that appears, select option 1 to install VS Code Server:

```
===================================
VS Code Server Management Interface
===================================
Created by Mahdi Saberi (DevMeta)
Website: https://devmeta.ir
===================================
1. Install VS Code Server
2. Create New VS Code Account
3. Change VS Code Server Password
4. Update VS Code Server
5. Backup VS Code Server Settings
6. Change Domain
7. Exit
Choose an option (1-7):
```

### 4. Provide Installation Information

When prompted, provide the following information:

- Your domain name (e.g., vscode.example.com) or IP address
- Password for the root account

### 5. SSL Configuration

The script will ask if you want to set up SSL with Let's Encrypt. We recommend selecting "y" for secure HTTPS access.

### 6. Access VS Code Server

After installation completes, you can access VS Code Server by navigating to:

- `https://yourdomain.com` (if SSL was enabled)
- `http://yourdomain.com` (if SSL was not enabled)

Log in using the password you set during installation.

## Post-Installation

After successful installation, consider:

1. Creating additional user accounts (option 2 from the main menu)
2. Setting up regular backups (option 5 from the main menu)
3. Installing your preferred VS Code extensions

## Common Issues

If you encounter any issues during installation, please refer to our [Troubleshooting Guide](TROUBLESHOOTING.md).
