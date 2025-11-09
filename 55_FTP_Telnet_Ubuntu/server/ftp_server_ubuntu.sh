#!/bin/bash
# FTP Server Setup Script for Ubuntu

echo "=== FTP SERVER SETUP (Ubuntu) ==="

# 1. Update package list
apt update

# 2. Install FTP server
apt install -y vsftpd

# 3. Create FTP users
useradd -m ftpuser1
useradd -m ftpuser2
echo "ftpuser1:ubuntu123" | chpasswd
echo "ftpuser2:ubuntu123" | chpasswd

# 4. Setup public directory
mkdir -p /srv/ftp/pub/upload
chmod 755 /srv/ftp/pub
chmod 777 /srv/ftp/pub/upload

# Create ftp user and group if not exists
id -u ftp &>/dev/null || useradd -r -s /sbin/nologin ftp
chown ftp:ftp /srv/ftp/pub/upload

# 5. Create test files in pub directory
echo "Welcome to Ubuntu FTP Public Directory!" > /srv/ftp/pub/welcome.txt
echo "This is a test file for download from Ubuntu FTP" > /srv/ftp/pub/testfile.txt
echo "Upload your files here!" > /srv/ftp/pub/upload/instructions.txt
chmod 644 /srv/ftp/pub/*.txt

# 6. Backup original config and copy new one
cp /etc/vsftpd.conf /etc/vsftpd.conf.backup
cp ./server/vsftpd_ubuntu.conf /etc/vsftpd.conf

# 7. Configure firewall (Ubuntu uses ufw)
ufw allow 21/tcp
ufw allow 20/tcp
ufw allow 30000:31000/tcp
echo "y" | ufw --force enable

# 8. Start FTP service
systemctl enable vsftpd
systemctl restart vsftpd

echo "=== FTP SERVER CONFIGURED ==="
echo "Anonymous FTP: Enabled"
echo "Public directory: /srv/ftp/pub"
echo "Upload directory: /srv/ftp/pub/upload"
echo "Test users: ftpuser1, ftpuser2 (password: ubuntu123)"

# 9. Verify service
systemctl status vsftpd --no-pager
echo "FTP server listening on:"
netstat -tlnp | grep :21
