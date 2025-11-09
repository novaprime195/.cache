# Experiment 57 Answer Sheet: FTP and Telnet Configuration

## Important Configuration Files and Locations

### FTP Configuration Files:
1. **`/etc/vsftpd/vsftpd.conf`** - Main FTP server configuration
2. **`/etc/vsftpd/user_list`** - Allowed FTP users list
3. **`/etc/vsftpd/chroot_list`** - Users restricted to home directory
4. **`/var/ftp/pub/`** - Public directory accessible to all

### Telnet Configuration Files:
1. **`/etc/xinetd.d/telnet`** - Telnet service configuration (xinetd)
2. **`/etc/securetty`** - Secure terminal configuration
3. **`/etc/hosts.allow`** - Access control (optional)
4. **`/etc/hosts.deny`** - Access restrictions (optional)

## Implementation Steps

### FTP Server Setup:
1. **Install**: `yum install vsftpd`
2. **Configure**: Edit `/etc/vsftpd/vsftpd.conf`
   - Enable anonymous FTP: `anonymous_enable=YES`
   - Allow uploads: `anon_upload_enable=YES`
   - Set public root: `anon_root=/var/ftp`
3. **Create public directory**: `mkdir -p /var/ftp/pub/upload`
4. **Set permissions**: `chmod 755 /var/ftp/pub; chmod 777 /var/ftp/pub/upload`
5. **Configure SELinux**: `setsebool -P ftpd_full_access on`
6. **Start service**: `systemctl start vsftpd`
7. **Enable firewall**: `firewall-cmd --add-service=ftp`

### Telnet Server Setup:
1. **Install**: `yum install telnet-server`
2. **Enable service**: `systemctl enable telnet.socket`
3. **Start service**: `systemctl start telnet.socket`
4. **Configure firewall**: `firewall-cmd --add-service=telnet`
5. **Create users**: `useradd telnetuser1`

## Public Folder Configuration:
- **Location**: `/var/ftp/pub`
- **Permissions**: 755 (read/execute for all)
- **Upload directory**: `/var/ftp/pub/upload` (777 permissions)
- **Access**: Anonymous FTP enabled
- **Content**: Welcome files and test documents

## Key Services and Ports:
- **FTP**: Port 21 (vsftpd service)
- **Telnet**: Port 23 (telnet.socket)
- **Passive FTP**: Ports 30000-31000

## Testing Commands:
```bash
# FTP Testing
ftp 192.168.1.10
# Login as: anonymous / anonymous@domain.com

# Telnet Testing  
telnet 192.168.1.10
# Login with created user credentials

# Service Status
systemctl status vsftpd
systemctl status telnet.socket
```

## Security Considerations:
- Telnet transmits in plain text (use SSH in production)
- Anonymous FTP has upload restrictions
- Firewall rules configured for both services
- SELinux policies adjusted for FTP functionality
