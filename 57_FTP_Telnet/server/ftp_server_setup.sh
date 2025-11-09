#!/bin/bash
# FTP Server Setup Script (vsftpd)

echo "=== FTP SERVER SETUP ==="

# 1. Install FTP server
yum install -y vsftpd

# 2. Create FTP users
useradd -m ftpuser1
useradd -m ftpuser2
echo "ftp123" | passwd --stdin ftpuser1
echo "ftp123" | passwd --stdin ftpuser2

# 3. Setup public directory
mkdir -p /var/ftp/pub/upload
chmod 755 /var/ftp/pub
chmod 777 /var/ftp/pub/upload
chown ftp:ftp /var/ftp/pub/upload

# 4. Create test files in pub directory
echo "Welcome to FTP Public Directory!" > /var/ftp/pub/welcome.txt
echo "This is a test file for download" > /var/ftp/pub/testfile.txt
chmod 644 /var/ftp/pub/*.txt

# 5. Configure SELinux for FTP
setsebool -P ftpd_full_access on
setsebool -P ftpd_anon_write on

# 6. Start FTP service
systemctl enable vsftpd
systemctl start vsftpd

# 7. Configure firewall
firewall-cmd --permanent --add-service=ftp
firewall-cmd --reload

echo "=== FTP SERVER CONFIGURED ==="
echo "Anonymous FTP: Enabled"
echo "Public directory: /var/ftp/pub"
echo "Upload directory: /var/ftp/pub/upload"
echo "Test users: ftpuser1, ftpuser2 (password: ftp123)"
