```
_________________

TCPDUMP FILTERS:
_________________

--> Below is a list of many of the most commonly used tcpdump filter expressions in Linux, along with a brief explanation for each:

Host-Based Filters:
-------------------
-> host <address>
Matches packets where the given IP address is either the source or destination.
Example: tcpdump host 192.168.1.100

-> src host <address>
Matches packets coming from the specified IP address.
Example: tcpdump src host 192.168.1.100

-> dst host <address>
Matches packets going to the specified IP address.
Example: tcpdump dst host 192.168.1.100

-> net <network>
Matches packets to or from any host within the specified network.
Example: tcpdump net 192.168.1.0/24

Port-Based Filters :
-------------------

-> port <port-number>
Matches packets where either the source or destination port equals the given number.
Example: tcpdump port 80

-> src port <port-number>
Matches packets with the specified source port.
Example: tcpdump src port 443

-> dst port <port-number>
Matches packets with the specified destination port.
Example: tcpdump dst port 53

Protocol Filters :
-----------------
-> tcp
Captures TCP packets.
Example: tcpdump tcp

-> udp
Captures UDP packets.
Example: tcpdump udp

-> icmp
Captures ICMP packets (commonly used for ping requests and replies).
Example: tcpdump icmp

-> ip / ip6
Filters IPv4 or IPv6 packets respectively.
Example: tcpdump ip or tcpdump ip6

Other Common Filters:
--------------------

-> broadcast
Matches packets sent to a broadcast address.
Example: tcpdump broadcast

-> multicast
Matches packets sent to a multicast address.
Example: tcpdump multicast

-> ether host <MAC-address>
Filters packets based on a specific Ethernet (MAC) address.
Example: tcpdump ether host 00:11:22:33:44:55


Combining Filters :
-------------------

-> You can combine these filters using logical operators:
and (or the implicit space) or and not

-> Example: tcpdump tcp and port 80 and not src host 192.168.1.100
These expressions allow you to narrow down your packet captures to precisely the traffic you’re interested in.

-> For example, if you only want to see incoming UDP packets on port 53 from a particular host, you might use:
tcpdump udp and dst port 53 and src host 192.168.1.100

Complex Examples:
----------------

-> When you list conditions separated by a space (or using "and"), tcpdump treats them as a logical AND.
Example:
tcpdump tcp and port 443 and src host 192.168.1.100

-> Using "or" to Capture Alternative Conditions:
The "or" operator lets you match packets that satisfy at least one of several conditions.
Example:
tcpdump udp and (port 53 or port 67)

-> Combining "or" and "not" for More Complex Scenarios:
You can nest operators with parentheses to create more complex filters.
Example:
tcpdump not (src host 192.168.1.1 or dst host 192.168.1.1)

-> Complex Filters with Multiple Groups:
example:
tcpdump (src net 192.168.1.0/24 and dst port 22) or (src net 10.0.0.0/8 and dst port 80)
Explanation:
The first group captures traffic from the 192.168.1.0/24 network that is destined for port 22 (typically SSH).
The second group captures traffic from the 10.0.0.0/8 network that is destined for port 80 (HTTP).
The use of parentheses ensures that the "and" conditions are evaluated together before applying the "or" between the groups.

-> Implicit "and" with Multiple Terms
When multiple filter expressions are provided without an explicit operator, tcpdump assumes "and" between them.
Example:
tcpdump tcp port 80


______________________________________________________________________________________________________________________________











```