# Experiment 58 Answer Sheet: NIS and NFS Configuration

## Important Configuration Files and Locations

### NIS Configuration Files:
1. **`/etc/yp.conf`** - NIS client configuration (domain and server settings)
2. **`/etc/ypserv.conf`** - NIS server security configuration
3. **`/var/yp/Makefile`** - NIS database generation configuration
4. **`/etc/nsswitch.conf`** - Name service switch configuration
5. **`/etc/sysconfig/network`** - Network domain settings

### NFS Configuration Files:
1. **`/etc/exports`** - NFS server export definitions
2. **`/etc/fstab`** - Client-side auto-mount configuration
3. **`/etc/sysconfig/nfs`** - NFS service configuration

## Key Implementation Steps

### Server Side (192.168.1.10):
1. Install packages: `yum install ypserv ypbind yp-tools nfs-utils`
2. Set NIS domain: `echo "NISDOMAIN=lab.com" >> /etc/sysconfig/network`
3. Create users/groups with specific UIDs/GIDs
4. Generate NIS maps: `make -C /var/yp`
5. Configure NFS exports in `/etc/exports`
6. Start services: `systemctl start ypserv ypbind nfs-server`

### Client Side (192.168.1.20):
1. Install packages: `yum install ypbind yp-tools nfs-utils`
2. Configure NIS client in `/etc/yp.conf`
3. Modify `/etc/nsswitch.conf` for NIS integration
4. Mount NFS shares and configure auto-mount
5. Start services: `systemctl start ypbind`

## Users and Groups Created:
- **developers** (GID: 1001): alice, bob, eve
- **admins** (GID: 1002): charlie, diana

## Verification Commands:
- `ypcat passwd` - View NIS user database
- `ypcat group` - View NIS group database
- `showmount -e server` - List NFS exports
- `df -h | grep nfs` - Show mounted NFS shares
- `ypwhich` - Show NIS server being used

## Network Configuration:
- Server: nisserver.lab.com (192.168.1.10)
- Client: nisclient.lab.com (192.168.1.20)
- Domain: lab.com

## File Permissions and Access:
- `/shared/developers` - Read/Write for developers group
- `/shared/admins` - Read/Write for admins group
- `/shared/common` - Read-only for all users
