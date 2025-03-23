# VS Code Server Management Script
### Developed by Mahdi Saberi (DevMeta)

A comprehensive management interface for VS Code Server installation and configuration on Linux servers.

[🇮🇷 Persian Documentation (مستندات فارسی)](./README.fa.md)

## What is VS Code Server?

VS Code Server is an open-source version of Visual Studio Code that runs in the browser. Developed by Coder, it allows you to set up the powerful VS Code IDE on a server and access it through any web browser.

### Key Benefits:

1. **Access from Any Device**: Access your development environment from any device with a web browser - even mobile phones, tablets, or older computers.

2. **Centralized Code Storage**: All your projects and code are stored on the server, eliminating the need for synchronization or worrying about code loss.

3. **Enhanced Security**: Your code never leaves your server, everything runs on your infrastructure.

4. **Full VS Code Features**: Nearly all VS Code features including:
   - Extensions installation
   - IntelliSense (code completion)
   - Integrated terminal
   - Debugger and Git tools
   - File management and project execution

5. **High Performance**: All code processing and program execution happens on the server, reducing load on your local computer.

## Quick Start

```bash
git clone https://github.com/mahdi6992/VS-Code-Server-Management.git
cd VS-Code-Server-Management
chmod +x "VS-Code-Server-Management.sh"
./VS-Code-Server-Management.sh
```

## Features

This script provides a complete management interface for VS Code Server:

1. **Install VS Code Server**: Sets up VS Code Server with Nginx as a reverse proxy
2. **Create New VS Code Account**: Add new user accounts to your server
3. **Change VS Code Server Password**: Update the access password
4. **Update VS Code Server**: Upgrade to the latest version
5. **Backup VS Code Server Settings**: Create a complete backup of all configurations
6. **Change Domain**: Update your domain without reinstalling

## Requirements

- Debian/Ubuntu-based Linux distribution
- Root/sudo access
- A domain name pointing to your server's IP address (optional)

## Documentation

For detailed documentation, please visit:

- [Installation Guide](./docs/en/INSTALLATION.md)
- [Troubleshooting](./docs/en/TROUBLESHOOTING.md)

## Use Cases

- **Remote Developers**: For those who want to work from anywhere
- **Development Teams**: Create standardized development environments for all team members
- **Programming Education**: Set up a unified environment for all students
- **Resource-Limited Systems**: Code on lightweight devices like Chromebooks

## How to Use the Management Interface

After running the script, an interactive menu will appear. Select any option by entering its number:

1. For initial installation, select option 1 and enter your domain or IP address and password.
2. To create a new user, select option 2 and enter the username and password.
3. To change the password, select option 3 and enter the new password.
4. To update to the latest version, select option 4.
5. To create a backup, select option 5.
6. To change the domain, select option 6 and enter the new domain or IP address.

## Security

This script automatically implements:
- Password authentication
- SSL/TLS encryption for communications (optional)
- Nginx configuration as a reverse proxy
- Service isolation using systemd

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Support

For support and more information, visit [DevMeta](https://devmeta.ir). 