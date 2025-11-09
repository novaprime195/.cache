# Experiment 55: FTP and Telnet Configuration on Ubuntu

## Objective
Configure and demonstrate File Transfer Protocol (FTP) and Telnet services on Ubuntu with public folder access for all users.

## Lab Setup
- **FTP Server**: 192.168.1.10 (ftpserver.lab.com)
- **Telnet Server**: 192.168.1.10 (same machine)
- **Client**: 192.168.1.20 (client.lab.com)
- **OS**: Ubuntu Container

## Services Configured
### FTP Service (vsftpd):
- Anonymous FTP access enabled
- Public folder `/srv/ftp/pub` accessible to all
- Local user access with home directory
- Upload capability in `/srv/ftp/pub/upload`

### Telnet Service (inetutils-inetd):
- Remote terminal access via inetd
- User authentication required
- Multiple simultaneous connections supported

## Important Configuration Files

### FTP Configuration:
- `/etc/vsftpd.conf` - Main FTP server configuration
- `/etc/vsftpd.user_list` - Allowed FTP users
- `/etc/vsftpd.chroot_list` - Users restricted to home directory
- `/srv/ftp/pub/` - Public directory for all access

### Telnet Configuration:
- `/etc/inetd.conf` - Telnet service configuration
- `/etc/motd` - Message of the day for telnet users
- `/etc/securetty` - Secure terminal settings

## Ubuntu-Specific Features
- **Package Manager**: Uses `apt` instead of `yum`
- **Firewall**: Uses `ufw` instead of `firewalld`
- **Services**: Uses `systemd` and `inetd`
- **Paths**: `/srv/ftp/pub` for public FTP directory

## Key Commands
```bash
# FTP Server
systemctl start vsftpd
systemctl enable vsftpd

# Telnet Server
systemctl start inetutils-inetd
systemctl enable inetutils-inetd

# Firewall
ufw allow 21/tcp
ufw allow 23/tcp

# Client Testing
ftp 192.168.1.10
telnet 192.168.1.10
```

## Public Folder Access
- **Location**: `/srv/ftp/pub`
- **Permissions**: 755 (read/execute for all)
- **Upload Directory**: `/srv/ftp/pub/upload` (writable)
- **Anonymous Access**: Enabled
- **Content**: Welcome files and test documents
