# 🚀 Quick Implementation Guide - Experiment 58

## How to Run NIS and NFS Lab

### Prerequisites
- Server: 192.168.1.10 (nisserver.lab.com)
- Client: 192.168.1.20 (nisclient.lab.com)

### Server Setup (Run on 192.168.1.10)
```bash
cd experiment_58_NIS_NFS

# 1. Setup NIS Server
sudo ./server/nis_server_setup.sh

# 2. Setup NFS Server
sudo ./server/nfs_server_setup.sh
```

### Client Setup (Run on 192.168.1.20)
```bash
cd experiment_58_NIS_NFS

# 1. Setup NIS Client
sudo ./client/nis_client_setup.sh

# 2. Setup NFS Client
sudo ./client/nfs_client_setup.sh
```

### Testing (Run on Client)
```bash
# Test complete setup
./scripts/test_nis_nfs.sh

# Manual NIS tests
ypcat passwd
ypcat group
id alice

# Manual NFS tests
df -h | grep nfs
ls -la /mnt/developers
```

### Users Created
- **developers**: alice, bob, eve
- **admins**: charlie, diana
- **Passwords**: [username]123

### NFS Shares
- `/mnt/developers` - Read/Write for developers
- `/mnt/admins` - Read/Write for admins  
- `/mnt/common` - Read-Only for all

**Note**: Update /etc/hosts with correct IP addresses before running!
