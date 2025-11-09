#!/bin/bash
# Telnet Client Testing Script for Ubuntu

echo "=== TELNET CLIENT TESTING (Ubuntu) ==="

# 1. Install telnet client if not present
apt install -y telnet

echo "Testing Telnet connectivity..."

# 2. Test telnet connectivity
echo "=== Testing Telnet Connection ==="
echo "Checking telnet server accessibility:"
nc -zv 192.168.1.10 23 2>&1 && echo "✓ Telnet port 23 accessible" || echo "✗ Telnet port 23 not accessible"

# 3. Test basic telnet connection (non-interactive)
echo -e "\n=== Basic Telnet Test ==="
timeout 5 telnet 192.168.1.10 2>/dev/null && echo "✓ Telnet service responding" || echo "✗ Telnet service not responding"

# 4. Interactive telnet session instructions
echo -e "\n=== Manual Testing Instructions ==="
echo "To manually test telnet, use the following commands:"
echo ""
echo "1. Connect to server:"
echo "   telnet 192.168.1.10"
echo ""
echo "2. Available test users:"
echo "   - telnetuser1 (password: ubuntu123)"
echo "   - telnetuser2 (password: ubuntu123)"
echo ""
echo "3. Test commands after login:"
echo "   - whoami       (show current user)"
echo "   - pwd          (show current directory)"
echo "   - ls -la       (list files)"
echo "   - uname -a     (system information)"
echo "   - exit         (logout)"

# 5. Show telnet server status
echo -e "\n=== Telnet Server Status ==="
echo "Checking inetd service status:"
systemctl status inetutils-inetd --no-pager -l | head -10

echo "=== TELNET CLIENT TESTING COMPLETE ==="
echo ""
echo "NOTE: For security reasons, telnet transmits passwords in plain text."
echo "In production environments, use SSH instead of telnet."
