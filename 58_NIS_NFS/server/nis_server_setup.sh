#!/bin/bash
# NIS Server Configuration Script

echo "=== NIS SERVER SETUP ==="

# 1. Install NIS packages
yum install -y ypserv ypbind yp-tools

# 2. Set domain name
echo "NISDOMAIN=lab.com" >> /etc/sysconfig/network
domainname lab.com

# 3. Configure /etc/hosts
cat >> /etc/hosts << EOF
192.168.1.10    nisserver.lab.com   nisserver
192.168.1.20    nisclient.lab.com   nisclient
EOF

# 4. Create users and groups
groupadd -g 1001 developers
groupadd -g 1002 admins

useradd -u 2001 -g developers alice
useradd -u 2002 -g developers bob
useradd -u 2003 -g admins charlie
useradd -u 2004 -g admins diana
useradd -u 2005 -g developers eve

# Set passwords
echo "alice123" | passwd --stdin alice
echo "bob123" | passwd --stdin bob
echo "charlie123" | passwd --stdin charlie
echo "diana123" | passwd --stdin diana
echo "eve123" | passwd --stdin eve

# 5. Configure NIS server
echo "# NIS Server Configuration" > /etc/ypserv.conf
echo "* : * : shadow" >> /etc/ypserv.conf

# 6. Generate NIS databases
cd /var/yp
make

# 7. Start services
systemctl enable ypserv ypbind
systemctl start ypserv ypbind

# 8. Configure firewall
firewall-cmd --permanent --add-service=nis
firewall-cmd --reload

echo "=== NIS SERVER CONFIGURED ==="
