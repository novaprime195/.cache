# Experiment 57: FTP and Telnet Configuration on CentOS/RedHat

## Objective
Configure and demonstrate File Transfer Protocol (FTP) and Telnet services with public folder access for all users.

## Lab Setup
- **FTP Server**: 192.168.1.10 (ftpserver.lab.com)
- **Telnet Server**: 192.168.1.10 (same machine)
- **Client**: 192.168.1.20 (client.lab.com)

## Services Configured
### FTP Service (vsftpd):
- Anonymous FTP access enabled
- Public folder `/var/ftp/pub` accessible to all
- Local user access with home directory

### Telnet Service:
- Remote terminal access
- User authentication required

## Important Configuration Files

### FTP Configuration:
- `/etc/vsftpd/vsftpd.conf` - Main FTP server configuration
- `/etc/hosts.allow` - Access control
- `/etc/hosts.deny` - Access restrictions

### Telnet Configuration:
- `/etc/xinetd.d/telnet` - Telnet service configuration
- `/etc/securetty` - Secure terminal settings

## Key Commands
```bash
# FTP Server
systemctl start vsftpd
systemctl enable vsftpd

# Telnet Server
systemctl start telnet.socket
systemctl enable telnet.socket

# Client Testing
ftp 192.168.1.10
telnet 192.168.1.10
```

## Public Folder Access
- Location: `/var/ftp/pub`
- Permissions: 755 (read/execute for all)
- Anonymous access enabled
- File upload to specific directory allowed
