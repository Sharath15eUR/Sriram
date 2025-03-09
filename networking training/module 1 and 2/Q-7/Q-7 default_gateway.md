```
Default Gateway:
----------------

Role in Networking:
-------------------

The default gateway is usually a router or a network device that connects your local area network (LAN) to external networks. When your device doesn’t have a specific route for an IP address, it sends the data to the default gateway for further routing.

Functionality:
---------------

Packet Forwarding: It receives outgoing packets from devices within the LAN and determines the best 
route for these packets to reach their destination outside the local network.

Traffic Management:
------------------
In addition to routing traffic, the gateway often performs Network Address Translation (NAT), 
allowing multiple devices on a private network to access the internet using a single public IP address.

Access Control and Security:
--------------------------------

It can also implement firewall rules and other security policies to protect the network.


Configuration:
--------------

On most networks, the default gateway is assigned automatically via DHCP.
In static IP configurations, the gateway is manually set in the network configuration files.

Routing Concept:
----------------

In the routing table, the default gateway is usually represented as the “default” route.
When no specific route exists for a destination IP address, the traffic is sent to the default gateway.

To identify the default gateway:
----------------------------------

use command ip route | grep default or route -n

result: ( In kali VM)
------
                                                                                                                                                                                                                                            
┌──(kali㉿kali)-[~]
└─$ ip route | grep default
default via 192.168.171.102 dev eth0 proto dhcp src 192.168.171.58 metric 100 
┌──(kali㉿kali)-[~]
└─$ route -n
Kernel IP routing table
Destination     Gateway         Genmask         Flags Metric Ref    Use Iface
0.0.0.0         192.168.171.102 0.0.0.0         UG    100    0        0 eth0
192.168.171.0   0.0.0.0         255.255.255.0   U     100    0        0 eth0

Verify Reachability:
--------------------

Using the ping Command

Once you know the default gateway's IP address, check its connectivity by running:
ping -c n <ip of default gateway>

┌──(kali㉿kali)-[~]
└─$ ping 192.168.171.102                                   
PING 192.168.171.102 (192.168.171.102) 56(84) bytes of data.
64 bytes from 192.168.171.102: icmp_seq=1 ttl=64 time=77.9 ms
64 bytes from 192.168.171.102: icmp_seq=2 ttl=64 time=2.99 ms

raceroute/Tracert:
--------------------

Purpose:
---------
This tool helps determine the path your packets take to reach the destination.
Running a traceroute to an external website can reveal whether the first hop is your default gateway.

┌──(kali㉿kali)-[~]
└─$ traceroute google.com
traceroute to google.com (142.250.193.142), 30 hops max, 60 byte packets
 1  192.168.171.102 (192.168.171.102)  8.548 ms  8.452 ms  8.386 ms
 2  192.168.17.10 (192.168.17.10)  261.987 ms  261.944 ms  261.882 ms
                                                                                                                                                                                             
```