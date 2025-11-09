#!/bin/bash
# Quick Setup Script - Run this to configure both FTP and Telnet

echo "=== QUICK FTP AND TELNET SETUP ==="

# Install all required packages
echo "Installing packages..."
yum install -y vsftpd telnet-server telnet ftp

# Setup FTP
echo "Configuring FTP..."
mkdir -p /var/ftp/pub/upload
chmod 755 /var/ftp/pub
chmod 777 /var/ftp/pub/upload
echo "Welcome to Public FTP!" > /var/ftp/pub/welcome.txt

# Copy FTP configuration
cp ./server/vsftpd.conf /etc/vsftpd/vsftpd.conf

# Setup Telnet
echo "Configuring Telnet..."
systemctl enable telnet.socket
systemctl start telnet.socket

# Create test users
useradd -m ftpuser1 && echo "ftp123" | passwd --stdin ftpuser1
useradd -m telnetuser1 && echo "telnet123" | passwd --stdin telnetuser1

# Configure SELinux and Firewall
setsebool -P ftpd_full_access on
firewall-cmd --permanent --add-service=ftp
firewall-cmd --permanent --add-service=telnet
firewall-cmd --reload

# Start services
systemctl enable vsftpd
systemctl start vsftpd

echo "=== SETUP COMPLETE ==="
echo "FTP: Anonymous access enabled, Public dir: /var/ftp/pub"
echo "Telnet: Service running on port 23"
echo "Test users: ftpuser1/telnetuser1 (password: ftp123/telnet123)"
