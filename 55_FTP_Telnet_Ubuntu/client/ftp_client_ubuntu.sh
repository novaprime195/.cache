#!/bin/bash
# FTP Client Testing Script for Ubuntu

echo "=== FTP CLIENT TESTING (Ubuntu) ==="

# 1. Install FTP client
apt install -y ftp

echo "Testing FTP connectivity..."

# 2. Test anonymous FTP connection
echo "=== Testing Anonymous FTP ==="
cat > /tmp/ftp_anonymous.txt << 'EOF'
open 192.168.1.10
user anonymous anonymous@ubuntu.lab
binary
ls
cd pub
ls
get welcome.txt /tmp/welcome_downloaded.txt
put /etc/hostname upload/client_hostname.txt
quit
EOF

echo "Executing anonymous FTP commands:"
ftp -n < /tmp/ftp_anonymous.txt

# 3. Test authenticated FTP
echo -e "\n=== Testing Authenticated FTP ==="
cat > /tmp/ftp_auth.txt << 'EOF'
open 192.168.1.10
user ftpuser1 ubuntu123
ls
pwd
mkdir testdir
quit
EOF

ftp -n < /tmp/ftp_auth.txt

# 4. Verify downloads
echo -e "\n=== Verification ==="
if [ -f /tmp/welcome_downloaded.txt ]; then
    echo "✓ Anonymous FTP download successful:"
    cat /tmp/welcome_downloaded.txt
else
    echo "✗ Anonymous FTP download failed"
fi

# 5. Show FTP server status
echo -e "\n=== FTP Server Status ==="
echo "Checking if FTP server is accessible:"
nc -zv 192.168.1.10 21 2>&1 && echo "✓ FTP port 21 accessible" || echo "✗ FTP port 21 not accessible"

echo "=== FTP CLIENT TESTING COMPLETE ==="
