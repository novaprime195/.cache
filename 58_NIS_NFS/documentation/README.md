# Experiment 58: NIS and NFS Configuration on CentOS/RedHat

## Objective
Configure and demonstrate Network Information Service (NIS) and Network File System (NFS) with 5 users and 2 groups on LAN-connected Linux systems.

## Lab Setup
- **NIS Server**: 192.168.1.10 (nisserver.lab.com)
- **NFS Server**: 192.168.1.10 (same machine)
- **Client**: 192.168.1.20 (nisclient.lab.com)

## Users and Groups
### Users Created:
1. alice (group: developers)
2. bob (group: developers)
3. charlie (group: admins)
4. diana (group: admins)
5. eve (group: developers)

### Groups:
- developers (GID: 1001)
- admins (GID: 1002)

## Important Configuration Files

### NIS Configuration Files:
- `/etc/yp.conf` - NIS client configuration
- `/var/yp/Makefile` - NIS database generation
- `/etc/ypserv.conf` - NIS server configuration
- `/etc/sysconfig/network` - Network domain settings

### NFS Configuration Files:
- `/etc/exports` - NFS export definitions
- `/etc/fstab` - Auto-mount configuration
- `/etc/sysconfig/nfs` - NFS service settings

## Key Commands
```bash
# NIS Server
make -C /var/yp
systemctl start ypserv ypbind

# NFS Server
exportfs -ra
systemctl start nfs-server

# Client
ypbind
mount -t nfs server:/shared /mnt/shared
```

## Verification Steps
1. `ypcat passwd` - View NIS user database
2. `ypcat group` - View NIS group database
3. `showmount -e server` - List NFS exports
4. `df -h` - Check mounted filesystems
