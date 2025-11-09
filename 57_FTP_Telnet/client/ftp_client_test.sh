#!/bin/bash
# FTP Client Testing Script

echo "=== FTP CLIENT TESTING ==="

# 1. Install FTP client
yum install -y ftp

# 2. Test anonymous FTP connection
echo "Testing Anonymous FTP Access:"
cat > /tmp/ftp_commands.txt << EOF
open 192.168.1.10
anonymous
anonymous@lab.com
binary
cd pub
ls
get welcome.txt
put /etc/hosts upload/client_hosts.txt
quit
EOF

echo "Executing FTP commands:"
ftp -n < /tmp/ftp_commands.txt

# 3. Test authenticated FTP
echo -e "\nTesting Authenticated FTP:"
cat > /tmp/ftp_auth.txt << EOF
open 192.168.1.10
ftpuser1
ftp123
ls
pwd
quit
EOF

ftp -n < /tmp/ftp_auth.txt

# 4. Verify downloads
echo -e "\nDownloaded files:"
ls -la welcome.txt 2>/dev/null || echo "welcome.txt not downloaded"

echo "=== FTP CLIENT TESTING COMPLETE ==="
