# SETUP SFPT SERVER
### Make a new group for users who should be limited to using only sftp
```
sudo groupadd sftponly
```
### Edit /etc/ssh/sshd_config
```
sudo nano /etc/ssh/sshd_config
# Inside sshd_config file change Subsystem line to
Subsystem sftp internal-sftp
# and add these lines to the end of /etc/ssh/sshd_config: 
Match group sftponly
ChrootDirectory %h
X11Forwarding no
AllowTcpForwarding no
ForceCommand internal-sftp
```
### Restart sshd service
```
sudo service sshd restart
```
### Create a new user and set password for that user
```
sudo adduser mrsurvivors -G sftponly -m -d /mnt/s3_wj-coral/mrsurvivors
sudo passwd mrsurvivors
[pw: worksjapan]
```
### Create a new key.pem for mrsurvivors in AWS Console
[siteId]_[username].pem
Ex: mrsurvivors.pem
```
su mrsurvivors
mkdir ~/.ssh && chmod 700 ~/.ssh
ssh-keygen -t rsa
cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
chmod 600 ~/.ssh/authorized_keys
```
### Open the private key generated on server and copy - paste its content into mrsurvivors.pem in your local machine
```
nano ~/.ssh/id_rsa
[-On local machine-]
nano mrsurvivors.pem
chmod 600 mrsurvivors.pem
```
### Change owner of the mrsurvivors folder to root:root & set permission to 755 as it is required by sshd service 
```
sudo chown root:root /mnt/s3_wj-coral/mrsurvivors
sudo chmod 755 /mnt/s3_wj-coral/mrsurvivors
```
### Create an home, public, private directory and allow user to write in that folders instead of its home directory 
```
sudo mkdir /mnt/s3_wj-coral/mrsurvivors/home
sudo mkdir /mnt/s3_wj-coral/mrsurvivors/home/public
sudo mkdir /mnt/s3_wj-coral/mrsurvivors/home/private
sudo chown root:root /mnt/s3_wj-coral/mrsurvivors/home
sudo chown mrsurvivors:mrsurvivors /mnt/s3_wj-coral/mrsurvivors/home/public
sudo chown mrsurvivors:mrsurvivors /mnt/s3_wj-coral/mrsurvivors/home/private
```
### Sftp login from your local machine
```
sftp -i mrsurvivors.pem mrsurvivors@52.192.120.186
```
