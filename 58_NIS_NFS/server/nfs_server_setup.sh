#!/bin/bash
# NFS Server Configuration Script

echo "=== NFS SERVER SETUP ==="

# 1. Install NFS packages
yum install -y nfs-utils nfs-utils-lib

# 2. Create shared directories
mkdir -p /shared/developers
mkdir -p /shared/admins
mkdir -p /shared/common

# 3. Set permissions
chown alice:developers /shared/developers
chown charlie:admins /shared/admins
chmod 775 /shared/developers /shared/admins
chmod 755 /shared/common

# 4. Configure exports
cat > /etc/exports << EOF
# NFS Exports Configuration
/shared/developers  192.168.1.0/24(rw,sync,no_root_squash)
/shared/admins      192.168.1.0/24(rw,sync,no_root_squash)
/shared/common      192.168.1.0/24(ro,sync)
EOF

# 5. Start NFS services
systemctl enable nfs-server rpcbind
systemctl start rpcbind nfs-server

# 6. Export filesystems
exportfs -ra

# 7. Configure firewall
firewall-cmd --permanent --add-service=nfs
firewall-cmd --permanent --add-service=rpc-bind
firewall-cmd --permanent --add-service=mountd
firewall-cmd --reload

echo "=== NFS SERVER CONFIGURED ==="

# 8. Verify exports
echo "Current NFS exports:"
exportfs -v
