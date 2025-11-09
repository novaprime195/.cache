#!/bin/bash
# NFS Client Configuration Script

echo "=== NFS CLIENT SETUP ==="

# 1. Install NFS client packages
yum install -y nfs-utils

# 2. Create mount points
mkdir -p /mnt/developers
mkdir -p /mnt/admins
mkdir -p /mnt/common

# 3. Test NFS connectivity
echo "Testing NFS server connectivity..."
showmount -e nisserver.lab.com

# 4. Mount NFS shares manually
mount -t nfs nisserver.lab.com:/shared/developers /mnt/developers
mount -t nfs nisserver.lab.com:/shared/admins /mnt/admins
mount -t nfs nisserver.lab.com:/shared/common /mnt/common

# 5. Configure auto-mount in /etc/fstab
cat >> /etc/fstab << EOF
# NFS Auto-mount Configuration
nisserver.lab.com:/shared/developers /mnt/developers nfs defaults 0 0
nisserver.lab.com:/shared/admins     /mnt/admins     nfs defaults 0 0
nisserver.lab.com:/shared/common     /mnt/common     nfs ro       0 0
EOF

echo "=== NFS CLIENT CONFIGURED ==="

# 6. Verify mounts
echo "Current NFS mounts:"
df -h | grep nfs
