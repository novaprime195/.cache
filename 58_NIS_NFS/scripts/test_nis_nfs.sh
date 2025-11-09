#!/bin/bash
# Complete Testing and Verification Script

echo "=== NIS AND NFS TESTING SCRIPT ==="

echo "1. Testing NIS Functionality:"
echo "------------------------------"

# Test NIS domain
echo "Current NIS domain: $(domainname)"

# Test NIS server connectivity
echo "NIS server status:"
ypwhich

# List all users from NIS
echo "All NIS users:"
ypcat passwd | cut -d: -f1,3,4

# List all groups from NIS
echo "All NIS groups:"
ypcat group | cut -d: -f1,3

# Test user authentication
echo "Testing user lookup:"
for user in alice bob charlie diana eve; do
    id $user 2>/dev/null && echo "$user: Found" || echo "$user: Not found"
done

echo -e "\n2. Testing NFS Functionality:"
echo "------------------------------"

# Show NFS exports
echo "Available NFS exports:"
showmount -e nisserver.lab.com

# Show mounted NFS filesystems
echo "Currently mounted NFS shares:"
df -h | grep nfs

# Test file operations
echo "Testing file creation and permissions:"

# Test developers directory
if [ -w /mnt/developers ]; then
    echo "Creating test file in developers directory..."
    echo "Test file by $(whoami)" > /mnt/developers/test_dev.txt
    ls -la /mnt/developers/test_dev.txt
fi

# Test admins directory
if [ -w /mnt/admins ]; then
    echo "Creating test file in admins directory..."
    echo "Test file by $(whoami)" > /mnt/admins/test_admin.txt
    ls -la /mnt/admins/test_admin.txt
fi

# Test common directory (read-only)
echo "Testing read-only access to common directory:"
ls -la /mnt/common/

echo -e "\n3. Service Status:"
echo "-------------------"
echo "NIS services:"
systemctl status ypbind --no-pager -l

echo "NFS client status:"
systemctl status nfs-client.target --no-pager -l

echo -e "\n=== TESTING COMPLETE ==="
