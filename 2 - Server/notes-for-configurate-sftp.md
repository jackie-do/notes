# NOTES WHEN CONFIGURATE SFTP
### Presetup, manage users in a group
```bash
# Set the primary group of an user
sudo usermod -g test test
# Clear the primary group of an user
sudo usermod -G "" test
# Add a secondary group to an user
sudo adduser test sftponly
# Remote an user from secondary group
sudo gpasswd -d test sftponly
```

### Allowed permissions of directories (when sftp to)
*User: test, Sftp group: sftponly*

**Home directory and parent directory of home must be belongs to root user with 755 permission**
```bash
sudo chown root:root [ChrootDirectory]
sudo chmod 755 [ChrootDirectory]
```
**The .ssh directory must be belongs to sftp user and sftp group, with permission 775**
```bash
sudo chown -R test:sftponly .ssh/
sudo chmod -R 755 .ssh/
```

### SFTP command
```bash
sftp  -oPort=2222  -oIdentityFile=~/.ssh/id_rsa test@127.0.0.1
```


### Check log when ssh or sftp
**In the file /etc/ssh/sshd_config, change value of key LogLevel to VERBOSE, and check log in /var/log/auth.log**
```bash
# Update ssh config to show log
sudo vim /etc/ssh/sshd_config # LogLevel VERBOSE 
sudo services sshd restart
# Check log
tail -f /var/log/auth.log 
```
