# Troubleshooting Guide

This document helps you solve common issues that may arise during the installation or usage of VS Code Server.

## Connection Issues

### Cannot access VS Code Server after installation

1. **Check if the service is running**:
   ```bash
   sudo systemctl status code-server@$USER
   ```
   If it's not running, start it:
   ```bash
   sudo systemctl start code-server@$USER
   ```

2. **Check Nginx configuration**:
   ```bash
   sudo nginx -t
   ```
   If there are errors, fix the configuration file at `/etc/nginx/sites-available/vscode`.

3. **Check firewall settings**:
   Make sure ports 80 and 443 (if using SSL) are open:
   ```bash
   sudo ufw status
   ```
   If they're blocked:
   ```bash
   sudo ufw allow 80/tcp
   sudo ufw allow 443/tcp
   ```

4. **Check domain DNS settings**:
   Make sure your domain correctly points to your server's IP address.

## Authentication Issues

### Forgot password

1. Reset the password by selecting option 3 from the main menu.
2. If you can't access the menu, you can manually update the password:
   ```bash
   sudo nano /etc/code-server/config.yaml
   ```
   Find the line with `password:` and update it.
   Then restart the service:
   ```bash
   sudo systemctl restart code-server@$USER
   ```

## SSL Certificate Issues

### SSL certificate has expired

1. Renew the certificate:
   ```bash
   sudo certbot renew
   ```

2. If that doesn't work, create a new certificate:
   ```bash
   sudo certbot --nginx -d yourdomain.com
   ```

## Update Issues

### Update fails

1. Check internet connectivity:
   ```bash
   ping github.com
   ```

2. Try manually downloading the latest version:
   ```bash
   cd ~
   wget https://github.com/coder/code-server/releases/download/latest/code-server_latest_amd64.deb
   sudo dpkg -i code-server_latest_amd64.deb
   rm code-server_latest_amd64.deb
   sudo systemctl restart code-server@$USER
   ```

## Performance Issues

### VS Code Server is running slowly

1. **Check server resources**:
   ```bash
   top
   ```
   Make sure you have enough CPU and RAM available.

2. **Close unnecessary extensions**:
   Too many extensions can slow down performance.

3. **Check disk space**:
   ```bash
   df -h
   ```
   If you're running low on disk space, free up some space.

## Getting Additional Help

If you continue to experience issues that are not covered in this guide, please:

1. Visit [DevMeta's website](https://devmeta.ir) for more information
2. Open an issue on our [GitHub repository](https://github.com/mahdi6992/VS-Code-Server-Management/issues) 