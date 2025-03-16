```
Question 10:
------------
Use Linux to view the MAC address table of a switch (if using a Linux-based network switch).
Use the bridge or ip link commands to inspect the MAC table and demonstrate a basic switch's operation.

Ans:
---

Viewing the MAC Address Table on a Linux-Based Network Switch

Introduction:
-------------
Linux-based network switches use the Linux kernel’s bridging functionality to operate as switches.
The MAC address table (or Forwarding Database, FDB) holds learned MAC addresses and their corresponding switch ports.
This table is crucial for directing traffic through the switch.

Identifying Bridge Interfaces:
------------------------------
First, list all active bridge interfaces on your system to identify the one you want to inspect (commonly named br0, br1, etc.).
-> ip link show type bridge
-> o/p -> 2: br0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state UP mode DEFAULT group default qlen 1000
    link/ether 02:42:ac:11:00:02 brd ff:ff:ff:ff:ff:ff

Viewing the MAC Address Table Using the Bridge Command:
---------------------------------------------------------
The bridge command (part of the iproute2 package) is used to display the MAC address table for a given bridge interface. 

-> bridge fdb show dev br0
-> 00:11:22:33:44:55 dev eth0 vlan 1 master br0 permanent
-> 66:77:88:99:aa:bb dev eth1 vlan 1 master br0 dynamic
-> cc:dd:ee:ff:00:11 dev eth2 vlan 1 master br0 dynamic

here:
----
00:11:22:33:44:55 is a statically assigned MAC address on interface eth0.
66:77:88:99:aa:bb and cc:dd:ee:ff:00:11 are dynamically learned MAC addresses on interfaces eth1 and eth2, respectively.
The keyword permanent indicates a static entry, while dynamic denotes an entry learned automatically by the switch.

```