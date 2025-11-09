#!/bin/bash
# NIS Client Configuration Script

echo "=== NIS CLIENT SETUP ==="

# 1. Install NIS packages
yum install -y ypbind yp-tools

# 2. Configure domain
echo "NISDOMAIN=lab.com" >> /etc/sysconfig/network
domainname lab.com

# 3. Configure /etc/hosts
cat >> /etc/hosts << EOF
192.168.1.10    nisserver.lab.com   nisserver
192.168.1.20    nisclient.lab.com   nisclient
EOF

# 4. Configure NIS client
cat > /etc/yp.conf << EOF
# NIS Client Configuration
domain lab.com server nisserver.lab.com
EOF

# 5. Configure nsswitch.conf
cp /etc/nsswitch.conf /etc/nsswitch.conf.bak
sed -i 's/passwd:     files/passwd:     files nis/' /etc/nsswitch.conf
sed -i 's/shadow:     files/shadow:     files nis/' /etc/nsswitch.conf
sed -i 's/group:      files/group:      files nis/' /etc/nsswitch.conf

# 6. Start NIS client
systemctl enable ypbind
systemctl start ypbind

echo "=== NIS CLIENT CONFIGURED ==="

# 7. Test NIS functionality
echo "Testing NIS connectivity..."
ypcat passwd | grep alice
