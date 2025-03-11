```
QUESTION:
----------

Host an FTP server and try PUT and GET operations.

Directory structure:
-------------------

FTP-client-ubuntu.txt -> Ftp client ubuntu VM's terminal output
FTP-server-kali.txt   -> Ftp server Kali VM's terminal output

steps in setting up FTP server and client:
---------------------------------------
Step 1: Install vsftpd (FTP Server) on Ubuntu VM
sudo apt update
sudo apt install vsftpd -y

Step 2: Start and Enable vsftpd Service
sudo systemctl start vsftpd
sudo systemctl enable vsftpd

Step 3: Configure vsftpd for Anonymous & Local User Access
sudo cp /etc/vsftpd.conf /etc/vsftpd.conf.bak  # Backup original config
sudo nano /etc/vsftpd.conf

Step 4: Modify the vsftpd.conf File
Uncomment or add the following lines:
anonymous_enable=NO
local_enable=YES
write_enable=YES
chroot_local_user=YES
allow_writeable_chroot=YES

Step 5: Restart vsftpd Service
sudo systemctl restart vsftpd

Step 6: Allow FTP Traffic in Firewall (if applicable)
sudo ufw allow 21/tcp

Step 7: Verify vsftpd is Running
sudo systemctl status vsftpd

Step 8: Install FTP Client on Kali VM
sudo apt update
sudo apt install ftp -y

Step 9: Connect from Kali VM to FTP Server on Ubuntu
ftp <Ubuntu_VM_IP>

Step 10: Login with Your Ubuntu VM Username & Password
Example:
Name (192.168.X.X:kali): <UbuntuUser>
Password: <YourPassword>

Step 11: List Files on FTP Server
ls

step 12: Upload a File to FTP Server
put /home/kali/Desktop/example.txt

step 13: Download a File from FTP Server
get example.txt

Step 14: Exit FTP Session
exit

Step 15: Check Active FTP Connections (on Ubuntu VM)
sudo netstat -tnp | grep ":21"


```
