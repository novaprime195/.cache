#!/bin/bash
# Telnet Server Setup Script for Ubuntu

echo "=== TELNET SERVER SETUP (Ubuntu) ==="

# 1. Install Telnet server and client
apt install -y telnetd telnet inetutils-inetd

# 2. Create telnet users
useradd -m telnetuser1
useradd -m telnetuser2
echo "telnetuser1:ubuntu123" | chpasswd
echo "telnetuser2:ubuntu123" | chpasswd

# 3. Configure inetd for telnet
cat > /etc/inetd.conf << 'EOF'
# Telnet configuration for Ubuntu
telnet stream tcp nowait telnetd /usr/sbin/in.telnetd in.telnetd
EOF

# 4. Enable and start inetd service
systemctl enable inetutils-inetd
systemctl restart inetutils-inetd

# 5. Configure firewall
ufw allow 23/tcp

# 6. Add telnet to securetty (allow terminal login)
echo "pts/0" >> /etc/securetty
echo "pts/1" >> /etc/securetty
echo "pts/2" >> /etc/securetty

# 7. Create test login message
cat > /etc/motd << 'EOF'
========================================
Welcome to Ubuntu Telnet Test Server
========================================
Test users: telnetuser1, telnetuser2
Password: ubuntu123
========================================
EOF

echo "=== TELNET SERVER CONFIGURED ==="
echo "Telnet service: Active"
echo "Test users: telnetuser1, telnetuser2 (password: ubuntu123)"
echo "Port: 23"

# 8. Test telnet service
echo "Testing telnet service status:"
systemctl status inetutils-inetd --no-pager
echo "Telnet server listening on:"
netstat -tlnp | grep :23
