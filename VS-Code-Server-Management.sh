#!/bin/bash

# Author: Mahdi Saberi (DevMeta)
# VS Code Server installation and management script
# Website: https://devmeta.ir

# Store domain globally
DOMAIN_FILE="/etc/vscode-server/domain.conf"

# Function to show main menu
show_main_menu() {
    clear
    echo "==================================="
    echo "VS Code Server Management Interface"
    echo "==================================="
    echo "Created by Mahdi Saberi (DevMeta)"
    echo "Website: https://devmeta.ir"
    echo "==================================="
    echo "1. Install VS Code Server"
    echo "2. Create New VS Code Account"
    echo "3. Change VS Code Server Password"
    echo "4. Update VS Code Server"
    echo "5. Backup VS Code Server Settings"
    echo "6. Change Domain"
    echo "7. Exit"
    read -p "Choose an option (1-7): " choice

    case $choice in
        1) install_vscode ;;
        2) create_vscode_account ;;
        3) change_vscode_password ;;
        4) update_vscode_server ;;
        5) backup_vscode_server ;;
        6) change_domain ;;
        7) exit 0 ;;
        *) echo "Invalid option!" ;;
    esac
}

# Function to install VS Code
install_vscode() {
    # Get domain from user
    echo "Enter your domain (e.g., vscode.example.com, example.com):"
    read DOMAIN

    # Store domain for future use
    sudo mkdir -p /etc/vscode-server
    echo "$DOMAIN" | sudo tee $DOMAIN_FILE > /dev/null

    # Get VS Code password from user
    echo "Enter your password for VS Code Server (root account):"
    read -s VSCODE_PASSWORD
    echo

    # Update system
    echo "Updating the system..."
    sudo apt update && sudo apt upgrade -y

    # Install dependencies
    echo "Installing Nginx and dependencies..."
    sudo apt install -y nginx curl gnupg2 ca-certificates lsb-release sudo

    # Install Node.js (using NVM)
    echo "Installing Node.js..."
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    nvm install --lts

    # Install code-server
    echo "Installing code-server..."
    cd ~
    wget https://github.com/coder/code-server/releases/download/v4.96.2/code-server_4.96.2_amd64.deb
    sudo dpkg -i code-server_4.96.2_amd64.deb
    rm code-server_4.96.2_amd64.deb

    # Configure systemd for code-server
    echo "Creating systemd service file for code-server..."
    sudo systemctl enable --now code-server@$USER

    # Setup VS Code Server password
    sudo mkdir -p /etc/code-server
    cat << EOF | sudo tee /etc/code-server/config.yaml > /dev/null
bind-addr: 127.0.0.1:8080
auth: password
password: $VSCODE_PASSWORD
cert: false
EOF

    # Create base Nginx configuration
    sudo tee /etc/nginx/sites-available/vscode << EOF
server {
    listen 80;
    server_name $DOMAIN;

    client_max_body_size 50M;

    location / {
        proxy_pass http://localhost:8080;
        proxy_set_header Host \$host;
        proxy_set_header Upgrade \$http_upgrade;
        proxy_set_header Connection upgrade;
        proxy_set_header Accept-Encoding gzip;
    }
}
EOF

    # Enable Nginx configuration
    sudo ln -sf /etc/nginx/sites-available/vscode /etc/nginx/sites-enabled/
    sudo rm -f /etc/nginx/sites-enabled/default
    sudo nginx -t && sudo systemctl restart nginx

    # SSL setup option
    echo "Do you want to set up SSL with Let's Encrypt? (y/n):"
    read SSL_CHOICE
    if [ "$SSL_CHOICE" == "y" ]; then
        sudo apt install -y certbot python3-certbot-nginx
        sudo certbot --nginx -d $DOMAIN
        echo "SSL has been successfully set up!"
    fi

    sudo systemctl restart code-server@$USER

    # Display installation completion message
    clear
    echo "====================================="
    echo "VS Code Server Installation Complete!"
    echo "====================================="
    echo "Installed by DevMeta Script"
    echo
    echo "Access Instructions for Root Account:"
    if [ "$SSL_CHOICE" == "y" ]; then
        echo "   https://$DOMAIN"
    else
        echo "   http://$DOMAIN"
    fi
    echo
    echo "2. Login using the password you set"
    echo
    echo "Note: Save these credentials for future access"
    echo "For support visit: https://devmeta.ir"
    echo "====================================="

    read -p "Press Enter to continue..."
}

# Function to create new VS Code account
create_vscode_account() {
    echo "Enter username for the new account:"
    read USERNAME

    echo "Enter password for $USERNAME:"
    read -s PASSWORD

    # Add the user
    sudo useradd -m -s /bin/bash "$USERNAME"

    # Set the password
    echo "$USERNAME:$PASSWORD" | sudo chpasswd

    # Add user to sudo group (optional)
    echo "Do you want to give $USERNAME sudo privileges? (y/n):"
    read SUDO_PRIVILEGES
    if [ "$SUDO_PRIVILEGES" == "y" ]; then
        sudo usermod -aG sudo "$USERNAME"
    fi

    echo "User $USERNAME has been created successfully!"
    read -p "Press Enter to continue..."
}

# Function to change VS Code Server password
change_vscode_password() {
    echo "Enter the new password for VS Code Server:"
    read -s NEW_PASSWORD

    # Update the password in the configuration
    sudo sed -i "s/^password: .*/password: $NEW_PASSWORD/" /etc/code-server/config.yaml

    # Restart the code-server service
    sudo systemctl restart code-server@$USER

    echo "VS Code Server password has been updated successfully!"
    echo "Your new password is now active."
    read -p "Press Enter to continue..."
}

# Function to update VS Code Server
update_vscode_server() {
    echo "Updating VS Code Server to the latest version..."

    # Stop the current service
    sudo systemctl stop code-server@$USER

    # Fetch the latest version link using GitHub API
    LATEST_VERSION=$(curl -s https://api.github.com/repos/coder/code-server/releases/latest | grep '"tag_name"' | sed -E 's/.*"([^"]+)".*/\1/')
    DOWNLOAD_URL="https://github.com/coder/code-server/releases/download/$LATEST_VERSION/code-server_${LATEST_VERSION}_amd64.deb"

    # Download and install the latest version
    cd ~
    echo "Downloading VS Code Server version $LATEST_VERSION..."
    wget -O code-server_latest_amd64.deb "$DOWNLOAD_URL"

    if [ -f code-server_latest_amd64.deb ]; then
        sudo dpkg -i code-server_latest_amd64.deb
        rm code-server_latest_amd64.deb

        # Restart the service
        sudo systemctl start code-server@$USER

        echo "VS Code Server has been successfully updated to version $LATEST_VERSION!"
    else
        echo "Failed to download the latest version. Please check your internet connection or try again later."
    fi

    read -p "Press Enter to continue..."
}

# Function to backup VS Code Server
backup_vscode_server() {
    echo "Creating backup of VS Code Server settings..."
    
    # Create backup directory
    BACKUP_DIR="$HOME/vscode_backup_$(date +%Y%m%d%H%M%S)"
    mkdir -p "$BACKUP_DIR"
    
    # Backup configuration files
    if [ -d "/etc/code-server" ]; then
        sudo cp -r /etc/code-server "$BACKUP_DIR/"
    fi
    
    if [ -f "$DOMAIN_FILE" ]; then
        sudo cp "$DOMAIN_FILE" "$BACKUP_DIR/"
    fi
    
    # Backup user data
    if [ -d "$HOME/.local/share/code-server" ]; then
        cp -r "$HOME/.local/share/code-server" "$BACKUP_DIR/"
    fi
    
    # Backup nginx configuration
    if [ -f "/etc/nginx/sites-available/vscode" ]; then
        sudo cp /etc/nginx/sites-available/vscode "$BACKUP_DIR/"
    fi
    
    # Create archive
    tar -czf "$HOME/vscode_backup_$(date +%Y%m%d%H%M%S).tar.gz" -C "$HOME" "$(basename "$BACKUP_DIR")"
    rm -rf "$BACKUP_DIR"
    
    echo "Backup completed successfully!"
    echo "Backup file: $HOME/vscode_backup_$(date +%Y%m%d%H%M%S).tar.gz"
    echo "Powered by DevMeta"
    read -p "Press Enter to continue..."
}

# Function to change domain
change_domain() {
    clear
    echo "==================================="
    echo "Change VS Code Server Domain"
    echo "DevMeta Configuration Utility"
    echo "==================================="

    # Check if domain file exists
    if [ -f "$DOMAIN_FILE" ]; then
        CURRENT_DOMAIN=$(cat "$DOMAIN_FILE")
        echo "Current domain: $CURRENT_DOMAIN"
    else
        echo "No domain configured yet."
    fi

    # Get new domain
    echo "Enter new domain (e.g., vscode.example.com):"
    read NEW_DOMAIN

    # Confirm
    echo "You are about to change the domain to: $NEW_DOMAIN"
    read -p "Continue? (y/n): " CONFIRM
    
    if [ "$CONFIRM" != "y" ]; then
        echo "Operation cancelled."
        read -p "Press Enter to continue..."
        return
    fi

    # Update domain file
    sudo mkdir -p /etc/vscode-server
    echo "$NEW_DOMAIN" | sudo tee $DOMAIN_FILE > /dev/null

    # Update Nginx configuration
    if [ -f "/etc/nginx/sites-available/vscode" ]; then
        # Backup old config
        sudo cp /etc/nginx/sites-available/vscode /etc/nginx/sites-available/vscode.bak
        
        # Update server_name in Nginx config
        sudo sed -i "s/server_name .*/server_name $NEW_DOMAIN;/" /etc/nginx/sites-available/vscode
        
        # Test and reload Nginx
        sudo nginx -t
        if [ $? -eq 0 ]; then
            sudo systemctl reload nginx
            echo "Nginx configuration updated successfully."
        else
            echo "Error in Nginx configuration. Reverting changes..."
            sudo cp /etc/nginx/sites-available/vscode.bak /etc/nginx/sites-available/vscode
            sudo systemctl reload nginx
            echo "Changes reverted."
        fi
    else
        echo "Warning: Nginx configuration file not found. Only domain settings were updated."
    fi

    # SSL certificate update if configured
    if [ -d "/etc/letsencrypt/live/$CURRENT_DOMAIN" ]; then
        echo "SSL certificate detected for previous domain."
        echo "Do you want to set up a new SSL certificate for $NEW_DOMAIN? (y/n):"
        read SSL_CHOICE
        if [ "$SSL_CHOICE" == "y" ]; then
            sudo certbot --nginx -d $NEW_DOMAIN
            echo "SSL has been updated for the new domain!"
        fi
    fi

    echo "Domain has been changed successfully to $NEW_DOMAIN"
    echo "Configuration by DevMeta"
    read -p "Press Enter to continue..."
}

# Start program with menu
while true; do
    show_main_menu
done
