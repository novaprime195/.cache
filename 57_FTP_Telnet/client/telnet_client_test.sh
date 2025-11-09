#!/bin/bash
# Telnet Client Testing Script

echo "=== TELNET CLIENT TESTING ==="

# 1. Install telnet client
yum install -y telnet

# 2. Test telnet connectivity
echo "Testing Telnet Connection to server:"
echo "Attempting to connect to 192.168.1.10 port 23"

# Test if telnet port is open
nc -zv 192.168.1.10 23 2>&1 || echo "Telnet port 23 not accessible"

# 3. Interactive telnet session info
echo -e "\nTo manually test telnet, use:"
echo "telnet 192.168.1.10"
echo ""
echo "Available test users:"
echo "- telnetuser1 (password: telnet123)"
echo "- telnetuser2 (password: telnet123)"

# 4. Automated telnet test (basic connectivity)
echo -e "\nTesting telnet service availability:"
timeout 5 telnet 192.168.1.10 2>/dev/null || echo "Telnet service not responding"

echo "=== TELNET CLIENT TESTING COMPLETE ==="

echo -e "\nManual Testing Instructions:"
echo "1. Run: telnet 192.168.1.10"
echo "2. Login with: telnetuser1 / telnet123"
echo "3. Execute commands: ls, pwd, whoami"
echo "4. Exit with: exit or logout"
