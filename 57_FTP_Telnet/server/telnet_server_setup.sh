#!/bin/bash
# Telnet Server Setup Script

echo "=== TELNET SERVER SETUP ==="

# 1. Install Telnet server
yum install -y telnet-server telnet

# 2. Create telnet users
useradd -m telnetuser1
useradd -m telnetuser2
echo "telnet123" | passwd --stdin telnetuser1
echo "telnet123" | passwd --stdin telnetuser2

# 3. Configure telnet service (systemd)
systemctl enable telnet.socket
systemctl start telnet.socket

# Alternative for xinetd (if needed)
# yum install -y xinetd
# systemctl enable xinetd
# systemctl start xinetd

# 4. Configure firewall
firewall-cmd --permanent --add-service=telnet
firewall-cmd --reload

# 5. Add telnet to securetty (allow root login if needed)
echo "pts/0" >> /etc/securetty
echo "pts/1" >> /etc/securetty
echo "pts/2" >> /etc/securetty

echo "=== TELNET SERVER CONFIGURED ==="
echo "Telnet service: Active"
echo "Test users: telnetuser1, telnetuser2 (password: telnet123)"
echo "Port: 23"

# Test telnet service
echo "Testing telnet service status:"
systemctl status telnet.socket --no-pager
