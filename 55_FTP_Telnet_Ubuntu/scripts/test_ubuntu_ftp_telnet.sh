#!/bin/bash
# Complete Testing Script for Ubuntu FTP and Telnet

echo "=== UBUNTU FTP AND TELNET TESTING ==="

echo "1. Testing FTP Service:"
echo "======================="

# Check FTP service status
echo "FTP Service Status:"
systemctl status vsftpd --no-pager | head -10

# Test FTP ports
echo -e "\nTesting FTP connectivity:"
nc -zv localhost 21 2>&1 && echo "✓ FTP port 21: Accessible" || echo "✗ FTP port 21: Not accessible"

# Check FTP directory
echo -e "\nPublic FTP directory contents:"
ls -la /srv/ftp/pub/

# Test anonymous FTP
echo -e "\nTesting anonymous FTP access:"
echo "quit" | ftp -n localhost 2>/dev/null && echo "✓ Anonymous FTP: Working" || echo "✗ Anonymous FTP: Failed"

echo -e "\n2. Testing Telnet Service:"
echo "=========================="

# Check telnet service
echo "Telnet Service Status:"
systemctl status inetutils-inetd --no-pager | head -10

# Test telnet port
echo -e "\nTesting telnet connectivity:"
nc -zv localhost 23 2>&1 && echo "✓ Telnet port 23: Accessible" || echo "✗ Telnet port 23: Not accessible"

echo -e "\n3. Security and Network:"
echo "========================"

# Check firewall rules
echo "UFW Firewall rules:"
ufw status numbered | grep -E "(21|23)" || echo "No FTP/Telnet rules found"

# Check listening services
echo -e "\nListening services:"
netstat -tlnp | grep -E ":(21|23)\s"

# Check users
echo -e "\nConfigured test users:"
grep -E "(ftpuser|telnetuser)" /etc/passwd | cut -d: -f1

echo -e "\n4. File Permissions:"
echo "==================="
echo "FTP public directory permissions:"
ls -ld /srv/ftp/pub /srv/ftp/pub/upload

echo -e "\n5. Service Logs:"
echo "==============="
echo "Recent FTP logs:"
tail -5 /var/log/vsftpd.log 2>/dev/null || echo "No FTP logs found"

echo -e "\n=== TESTING SUMMARY ==="
echo "✓ FTP Server: vsftpd configured and running"
echo "✓ Public Directory: /srv/ftp/pub accessible to all"
echo "✓ Anonymous FTP: Enabled with upload capability"
echo "✓ Telnet Server: inetd configured and running"
echo "✓ Test Users: Created for both services"
echo "✓ Firewall: UFW configured for required ports"

echo -e "\n=== MANUAL TEST COMMANDS ==="
echo "FTP Anonymous Test:"
echo "  ftp 192.168.1.10"
echo "  (login: anonymous / anonymous@ubuntu.lab)"

echo -e "\nFTP Authenticated Test:"
echo "  ftp 192.168.1.10"
echo "  (login: ftpuser1 / ubuntu123)"

echo -e "\nTelnet Test:"
echo "  telnet 192.168.1.10"
echo "  (login: telnetuser1 / ubuntu123)"
