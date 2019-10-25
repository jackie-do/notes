# MOUNTING S3 BUCKET TO EC2 DIRECTORY
### Install dependencies
```
sudo yum install -y gcc libstdc++-devel gcc-c++ fuse fuse-devel curl-devel libxml2-devel mailcap automake openssl-devel
```
### Compile from master via the following commands
```
git clone https://github.com/s3fs-fuse/s3fs-fuse.git
cd s3fs-fuse
./autogen.sh
./configure --prefix=/usr --with-openssl
make
sudo make install
```
### Setting AWS credentials
```
sudo echo AWS_ACCESS_KEY_ID:AWS_SECRET_ACCESS_KEY > /etc/passwd-s3fs
sudo chmod 600 /etc/passwd-s3fs
```
### Mount your S3 Bucket: (wj-coral)
```
sudo mkdir /mnt/s3_wj-coral
# Options
# - allow_other options to allow other users to access the file
# - mp_umask=022 equal to 'chmod 755' command and this is required for sshd to chroot_directory
sudo s3fs wj-coral /mnt/s3_wj-coral -o passwd_file=/etc/passwd-s3fs -o allow_other -o mp_umask=022
```
### Set automatically mount S3 bucket on reboot
```
sudo nano /etc/fstab
# Add this line
wj-coral /mnt/s3_wj-coral fuse.s3fs allow_other,mp_umask=022 0 0
```
