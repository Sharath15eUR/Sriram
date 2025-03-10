```
Note_1:
------

readme.md -> explains the process of establishing ssh  
Kali(VM) -> SSH sever
Ubuntu(VM) -> SSH client
ubuntu_ssh.txt -> terminal copy of ubuntu VM  
kali_ssh.txt -> terminal copy of kali VM  


Since I dont have access to a mainstream Linux machine , This answer demonstrates setting up SSH connection
between two VMs (Ubuntu 16.04 and Kali 2024.3 ) running on a same Hypervisor using bridged adapter to maintain
connectivity in the same private network managed by OracleVBox.

Note_2:
------
This question is also shared with Question 11 where it is req to demonstrate both SSH and Telnet. Thus ,
ssh has been implemented here and telnet will be implemented later for that question respectively. 

Note_3:
------
file structure located in kali vm to be copied to ubuntu VM via ssh  

   dir
   ├── 1.txt
   └── dir_1
       ├── 2.txt
       └── dir_2
           ├── 3.txt
           └── dir_3
               └── 4.tx


Question:
---------
Establishing SSH Connectivity Between Ubuntu and Kali VMs and transfer files 

Overview:
---------
This answer demonstrates the process of configuring secure SSH connectivity between two VirtualBox VMs running
Ubuntu and Kali Linux.The steps include setting up and verifying the SSH service, troubleshooting network
configurations, switching network modesfor direct communication, and finally establishing an SSH session from Ubuntu to Kali.

Step 1: SSH Service Setup on Kali:
----------------------------------
1.Checked the SSH service status on Kali:
   - Command: `sudo systemctl status ssh`
   - Observed that the service was inactive.
2.Started and enabled the SSH service:
   - Commands:
     - `sudo systemctl start ssh`
     - `sudo systemctl enable ssh`
3.Verified the service was running:
   - SSH service output confirmed it was active.

Step 2: Verifying IP Address on Kali:
------------------------------------
1.Obtained the IP address in NAT mode:
   - Command: `hostname -I`
   - Result: `10.0.2.15` (default NAT IP)
2.Tested local SSH connection on Kali (loopback test):
   - Command: `ssh kali@10.0.2.15`
   - Confirmed that the SSH session started successfully.

step 3: Configuring Network for Direct VM-to-VM Communication
-------------------------------------------------------------
1.Reviewed VirtualBox network options:
   - Options included NAT, NAT Network, Host-Only Adapter, and Bridged Adapter.
2.Changed both VMs’ network settings to "Bridged Adapter":
   - Ensured each VM would receive a unique IP address from the physical network’s DHCP server.
3.Rebooted the VMs and renewed the DHCP lease on Kali:
   - Command: `sudo dhclient -v`
   - Verified a new IP address in the expected network range (e.g., `192.168.x.x`).

Step 4: Establishing SSH Connection from Ubuntu to Kali
--------------------------------------------------------
1.On Kali, re-verified its new IP address:
   - Command: `hostname -I`
   - *(Example new IP: `192.168.1.101`)*
2.From the Ubuntu VM, initiated an SSH connection to Kali:
   - Command: `ssh kali@<Kali_IP>`
   - Replaced `<Kali_IP>` with the actual IP address (e.g., `ssh kali@192.168.1.101`)
3.Entered the Kali user password when prompted and confirmed a successful SSH session.

Troubleshooting & Notes:
------------------------
- If DHCP fails to assign a new IP in bridged mode, consider restarting the network interface or setting a static IP.
- Port forwarding using NAT mode is an alternative but was not used since direct communication via Bridged Adapter is simpler.
- Ensure that VirtualBox’s bridged adapter is connected to the correct physical network interface for proper IP assignment.

#Conclusion:
-----------
By following the steps above, secure SSH connectivity between the Ubuntu and Kali VMs was successfully established.
 This setup enables efficient remote management and file transfer between the two machines for further tasks or assignments.

```
