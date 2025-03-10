```
________________________
WIRESHARK FILTER OPTIONS:
________________________

NOTE:
-----

Wireshark supports two types of filters: capture filters (which use libpcap syntax similar to tcpdump) 
and display filters (which are Wireshark’s powerful, proprietary filtering language). 
Here, we'll focus on display filters, which allow you to combine conditions using logical operators.

Below are examples of common Wireshark display filters and how to combine them:


Host-Based Filters
-------------------

-> ip.addr == <address>
Matches packets where the IP address appears as either source or destination.
Example:
ip.addr == 192.168.1.100

-> ip.src == <address>
Matches packets with a specific source IP address.
Example:
ip.src == 192.168.1.100


-> ip.dst == <address>
Matches packets with a specific destination IP address.
Example:
ip.dst == 192.168.1.100

-> ip.addr == <network>
Matches packets from or to any host within the given network.
Example:
ip.addr == 192.168.1.0/24

Port-Based Filters:
--------------------

-> tcp.port == <port-number>
Matches packets where the TCP port is equal to the specified number (for either source or destination).
Example:
tcp.port == 80

-> udp.port == <port-number>
Matches packets where the UDP port equals the given number.
Example:
udp.port == 53

-> tcp.srcport == <port-number>
Filters packets by the TCP source port.
Example:
tcp.srcport == 443

-> tcp.dstport == <port-number>
Filters packets by the TCP destination port.
Example:
tcp.dstport == 22

tcp.dstport == <port-number>
Filters packets by the TCP destination port.
Example:
tcp.dstport == 22


Protocol Filters:
----------------

-> tcp
Displays only TCP packets.
Example:
tcp

-> udp
Displays only UDP packets.
Example:
udp

-> icmp
Displays only ICMP packets.
Example:
icmp


-> ip or ipv6
Displays only IPv4 or IPv6 packets, respectively.
Example:
ip


Combining Filters with Logical Operators:
---------------------------------------------

---> Wireshark display filters use the following logical operators:

i)&& for logical AND
ii)|| for logical OR
iii)! for logical NOT
iv)Parentheses () for grouping

-> Multiple Conditions with "&&"
Combine conditions to narrow down the display to specific traffic.

Example:
Show TCP packets on port 80 and only those with a source IP of 192.168.1.100
tcp && tcp.port == 80 && ip.src == 192.168.1.100

-> Using "||" for Alternative Conditions
Allow packets that satisfy one condition or another.
Example:
Display UDP packets where the port is either 53 or 67:
udp && (udp.port == 53 || udp.port == 67)

-> Excluding Traffic with "!"
Filter out unwanted traffic.
Example:
Show all IP packets except those from 192.168.1.1:
ip && !(ip.src == 192.168.1.1)

-> Combining "||" and "!" for More Complex Scenarios
Exclude packets where a specific IP is involved, either as source or destination.
Example:
Display packets where 192.168.1.1 is neither the source nor the destination:
!(ip.src == 192.168.1.1 || ip.dst == 192.168.1.1)

-> Complex Grouping with Multiple Conditions
Capture traffic based on multiple groups of criteria.
Example:
Display traffic from the 192.168.1.0/24 network destined for port 22 or traffic from the 10.0.0.0/8 network destined for port 80:
(ip.src == 192.168.1.0/24 && tcp.dstport == 22) || (ip.src == 10.0.0.0/8 && tcp.dstport == 80)


Capture Filters vs. Display Filters:
--------------------------------------

Capture Filters:
------------------
When capturing packets (e.g., setting a filter before starting a capture), Wireshark uses libpcap syntax—the same as tcpdump.
For instance, a capture filter for TCP traffic on port 80 would be:
tcp port 80

Display Filters:
------------------
Once packets are captured, display filters (like those above) allow you to refine the view of the packet list 
with a rich syntax that goes beyond what capture filters provide.


```
