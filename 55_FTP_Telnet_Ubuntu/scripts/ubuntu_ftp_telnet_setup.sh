#!/bin/bash
# Complete Ubuntu FTP and Telnet Setup Script

echo "=== UBUNTU FTP AND TELNET COMPLETE SETUP ==="

# 1. Update system
echo "Updating package list..."
apt update

# 2. Install all required packages
echo "Installing FTP and Telnet packages..."
apt install -y vsftpd telnetd telnet inetutils-inetd ftp netcat-openbsd

# 3. Configure FTP Server
echo "Configuring FTP Server..."
./server/ftp_server_ubuntu.sh

# 4. Configure Telnet Server  
echo "Configuring Telnet Server..."
./server/telnet_server_ubuntu.sh

# 5. Create additional test content
echo "Setting up additional test content..."
mkdir -p /srv/ftp/pub/documents
echo "Ubuntu Lab Documentation" > /srv/ftp/pub/documents/readme.txt
echo "FTP Test File $(date)" > /srv/ftp/pub/current_time.txt

# 6. Configure user list for FTP
echo "ftpuser1" > /etc/vsftpd.user_list
echo "ftpuser2" >> /etc/vsftpd.user_list

# 7. Create chroot list
touch /etc/vsftpd.chroot_list

# 8. Final service restart
echo "Restarting services..."
systemctl restart vsftpd
systemctl restart inetutils-inetd

# 9. Show service status
echo -e "\n=== SERVICE STATUS ==="
echo "FTP Service:"
systemctl status vsftpd --no-pager | head -5

echo -e "\nTelnet Service:"
systemctl status inetutils-inetd --no-pager | head -5

echo -e "\n=== FIREWALL STATUS ==="
ufw status numbered

echo -e "\n=== LISTENING PORTS ==="
echo "FTP (port 21):"
netstat -tlnp | grep :21
echo "Telnet (port 23):"
netstat -tlnp | grep :23

echo -e "\n=== SETUP COMPLETE ==="
echo "✓ FTP Server: vsftpd running on port 21"
echo "✓ Telnet Server: inetd running on port 23"
echo "✓ Public Directory: /srv/ftp/pub (accessible to all)"
echo "✓ Anonymous FTP: Enabled"
echo "✓ Test Users Created: ftpuser1, ftpuser2, telnetuser1, telnetuser2"
echo "✓ Firewall: Configured for FTP and Telnet"
