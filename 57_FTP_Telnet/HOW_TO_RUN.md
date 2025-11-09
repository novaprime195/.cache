# 🚀 Quick Implementation Guide - Experiment 57

## How to Run FTP and Telnet Lab

### Option 1: One-Click Setup
```bash
cd experiment_57_FTP_Telnet
sudo ./scripts/quick_setup.sh
```

### Option 2: Step-by-Step Setup
```bash
# 1. Setup FTP Server
sudo ./server/ftp_server_setup.sh

# 2. Setup Telnet Server  
sudo ./server/telnet_server_setup.sh

# 3. Test Both Services
./scripts/test_ftp_telnet.sh
```

### Testing Commands
```bash
# Test FTP (Anonymous)
ftp 192.168.1.10
# Login: anonymous / anonymous@lab.com

# Test FTP (Authenticated)
ftp 192.168.1.10  
# Login: ftpuser1 / ftp123

# Test Telnet
telnet 192.168.1.10
# Login: telnetuser1 / telnet123
```

### Public Folder Access
- **Location**: `/var/ftp/pub`
- **Files**: welcome.txt, testfile.txt
- **Upload**: `/var/ftp/pub/upload`

### Troubleshooting
```bash
# Check services
systemctl status vsftpd
systemctl status telnet.socket

# Check firewall
firewall-cmd --list-services
```

**Note**: Run all setup scripts as root/sudo!
