```
Question-9:
-----------
 
Describe how you would configure a basic LAN interface using the ip command in Linux (kernel.org).

Answer:
---------

Configuring a Basic LAN Interface Using the ip Command:
-------------------------------------------------------

-> Identify the Network Interface
First, list all available network interfaces to identify the one you want to configure (e.g., eth0, enp3s0, etc.).

-> ip link show

Bring the Interface Up:
-----------------------

-> To activate the interface, use the following command (replace eth0 with your actual interface name)
-> ip link set eth0 up

Assign an IP Address:
---------------------

Assign an IP address and subnet mask to the interface. 
-> For example, to set the IP to 192.168.1.10 with a 24-bit subnet mask, run:
-> ip addr add 192.168.1.10/24 dev eth0


Configure the Default Route (Optional):
---------------------------------------
If your LAN setup requires routing to other networks (such as accessing the internet), add a default route via your gateway.
-> For example, if the gateway is 192.168.1.1, use:
-> ip route add default via 192.168.1.1

Verify the Configuration:
---------------------------
Check the assigned IP address and interface status:
-> ip addr show dev eth0
-> ip route show

```