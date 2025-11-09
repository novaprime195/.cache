# Experiment 55 Answer Sheet: FTP and Telnet Configuration on Ubuntu

## Important Configuration Files and Locations

### FTP Configuration Files:
1. **`/etc/vsftpd.conf`** - Main FTP server configuration
2. **`/etc/vsftpd.user_list`** - Allowed FTP users list
3. **`/etc/vsftpd.chroot_list`** - Users restricted to home directory
4. **`/srv/ftp/pub/`** - Public directory accessible to all
5. **`/var/log/vsftpd.log`** - FTP server log file

### Telnet Configuration Files:
1. **`/etc/inetd.conf`** - Main telnet service configuration
2. **`/etc/motd`** - Message of the day for telnet sessions
3. **`/etc/securetty`** - Secure terminal configuration
4. **`/etc/passwd`** - User account information

## Implementation Steps

### FTP Server Setup (Ubuntu):
1. **Install**: `apt install vsftpd`
2. **Configure**: Edit `/etc/vsftpd.conf`
   - Enable anonymous FTP: `anonymous_enable=YES`
   - Allow uploads: `anon_upload_enable=YES`
   - Set public root: `anon_root=/srv/ftp`
   - Configure passive ports: `pasv_min_port=30000`, `pasv_max_port=31000`
3. **Create public directory**: `mkdir -p /srv/ftp/pub/upload`
4. **Set permissions**: `chmod 755 /srv/ftp/pub; chmod 777 /srv/ftp/pub/upload`
5. **Create user list**: `echo "ftpuser1" > /etc/vsftpd.user_list`
6. **Configure firewall**: `ufw allow 21/tcp; ufw allow 30000:31000/tcp`
7. **Start service**: `systemctl start vsftpd; systemctl enable vsftpd`

### Telnet Server Setup (Ubuntu):
1. **Install**: `apt install telnetd inetutils-inetd`
2. **Configure**: Edit `/etc/inetd.conf`
   - Add line: `telnet stream tcp nowait telnetd /usr/sbin/in.telnetd in.telnetd`
3. **Create users**: `useradd telnetuser1; echo "telnetuser1:ubuntu123" | chpasswd`
4. **Configure firewall**: `ufw allow 23/tcp`
5. **Start service**: `systemctl start inetutils-inetd; systemctl enable inetutils-inetd`
6. **Update securetty**: Add pts entries for terminal access

## Public Folder Configuration:
- **Location**: `/srv/ftp/pub`
- **Permissions**: 755 (read/execute for all)
- **Upload directory**: `/srv/ftp/pub/upload` (777 permissions)
- **Access method**: Anonymous FTP enabled
- **Content**: Welcome files, test documents, and upload instructions

## Key Services and Ports:
- **FTP**: Port 21 (vsftpd service)
- **FTP Passive**: Ports 30000-31000 (for data transfers)
- **Telnet**: Port 23 (inetutils-inetd service)

## Ubuntu-Specific Configuration:
- **Package manager**: `apt` (not `yum`)
- **Firewall**: `ufw` (not `firewalld`)
- **Service management**: `systemd` with `inetd` for telnet
- **FTP public path**: `/srv/ftp/pub` (Ubuntu convention)

## Testing Commands:
```bash
# FTP Testing (Anonymous)
ftp 192.168.1.10
# Login: anonymous / anonymous@ubuntu.lab

# FTP Testing (Authenticated)
ftp 192.168.1.10
# Login: ftpuser1 / ubuntu123

# Telnet Testing
telnet 192.168.1.10
# Login: telnetuser1 / ubuntu123

# Service Status
systemctl status vsftpd
systemctl status inetutils-inetd

# Firewall Status
ufw status
```

## Security Considerations:
- Telnet transmits data in plain text (use SSH in production)
- Anonymous FTP has controlled upload access
- UFW firewall configured for required ports only
- User accounts created with strong passwords
- Public directory has appropriate permissions (not world-writable)
