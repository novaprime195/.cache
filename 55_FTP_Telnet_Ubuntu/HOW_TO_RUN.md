# 🚀 Quick Implementation Guide - Experiment 55

## How to Run FTP and Telnet Lab on Ubuntu

### Prerequisites
- Server: 192.168.1.10 (ftpserver.lab.com)
- Client: 192.168.1.20 (client.lab.com)

### One-Click Setup
```bash
cd experiment_55_FTP_Telnet_Ubuntu

# Server setup
sudo ./scripts/ubuntu_ftp_telnet_setup.sh
```

### Manual Setup
```bash
# Server configuration
sudo ./server/ftp_server_ubuntu.sh
sudo ./server/telnet_server_ubuntu.sh

# Client testing
./client/ftp_client_ubuntu.sh
./client/telnet_client_ubuntu.sh
```

### Testing Commands
```bash
# Test FTP (Anonymous)
ftp 192.168.1.10
# Login: anonymous / anonymous@lab.com

# Test FTP (Authenticated)
ftp 192.168.1.10  
# Login: ftpuser / ubuntu123

# Test Telnet
telnet 192.168.1.10
# Login: telnetuser / ubuntu123
```

### Public Folder Access
- **Location**: `/srv/ftp/pub`
- **Files**: welcome.txt, testfile.txt
- **Upload**: `/srv/ftp/pub/upload` (writable by all)
- **Anonymous Access**: Enabled

### Key Ubuntu Differences
- Uses `vsftpd` for FTP (same as CentOS)
- Uses `telnetd` via `systemd` or `inetd`
- Different package names: `telnetd`, `vsftpd`
- Ubuntu-specific paths and configurations
- Uses `ufw` for firewall (instead of firewalld)

### Troubleshooting
```bash
# Check services
systemctl status vsftpd
systemctl status inetd

# Check firewall
ufw status

# Test connectivity
netstat -tlnp | grep -E "(21|23)"
```

**Note**: Run setup scripts with sudo!
