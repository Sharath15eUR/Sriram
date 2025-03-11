```

Question:
--------

Using terminal connect to a remote machine using telnet.

Note-1:
-----
The same bridged adapter config for two VMs running in the same hypervisor setup
explained in the Question - 1 for ssh is followed here.

Note-2:
-------
connecting to a remote machine via ssh have been answered in Q-1 where we use ssh to connect to a remote
server to use SCP command the next part of the question i.e connecting via telnet is answered here

Directory structure:
-------------------


1) readme.md -> process of setting up telnet client (ubuntu 16.04 Vm) and  telnet server (kali VM)

2) telnet-server-kali.txt -> terminl output of kali VM running telnet server

3) telnet-client-ubuntu.txt -> terminal output of ubuntu Vm connecting to kali VM running telnet server


Telnet Server and Client Setup Guide:
-----------------------------------------

This document explains how to set up a Telnet server on a Kali VM and a Telnet client on an Ubuntu VM, and how to establish a connection between the two.


Telnet Server Setup on Kali VM:
---------------------------------

1. Install Required Packages:
  
    -> Update the package list:
     
        sudo apt-get update
     
   -> Install xinetd and telnetd:
     
     sudo apt-get install xinetd telnetd
     

2. Configure the Telnet Service:

   -> Create (or edit) the Telnet configuration file for xinetd:
     
     sudo mousepad /etc/xinetd.d/telnet
     
   Add the following configuration:
     
     service telnet
     {
         flags           = REUSE
         socket_type     = stream
         wait            = no
         user            = root
         server          = /usr/sbin/telnetd
         log_on_failure  += USERID
         disable         = no
     }
    
   - Save and exit the editor.

3. Restart xinetd:

   -> Restart the xinetd service to load the new configuration:
     
     sudo service xinetd restart
     

4. Configure Root Login (if needed):

   -> Set a root password:
     
     sudo passwd root
     
   - (Optional) Edit `/etc/pam.d/login` to comment out the line containing `pam_securetty.so` if you need to allow root logins via Telnet.

5. Verify the Telnet Service:

   -> Check that Telnet is listening on port 23:
     
     netstat --inet -p | grep "/telnetd" | grep ESTABLISHED
     
   -> Obtain your Kali VM's IP address:
     
     hostname -I
     
   - You should see the IPv4 address (e.g., 192.168.1.4).


Telnet Client Setup on Ubuntu VM:
--------------------------------

1. Install Telnet Client:

   -> Update the package list:
     
     sudo apt-get update
    
   -> Install the Telnet client:
     
     sudo apt-get install telnet
    

2. Connect to the Telnet Server:

   -> Use the Telnet command followed by the Kali VM's IP address:
     
     telnet <Kali_VM_IP>
     
     Replace `<Kali_VM_IP>` with the actual IP (for example, 192.168.1.4).
     When prompted, log in using the appropriate username (e.g., kali) and password.

Final Notes

- Once connected, you'll see a login prompt and can run commands on the Kali VM.
- If you encounter connection issues, verify that:
  - The xinetd service is running on Kali.
  - The firewall is not blocking port 23.
  - The Telnet configuration file is correctly set up.

This guide should help you establish a working Telnet connection between two VMs.

```
