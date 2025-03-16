```
Question:
---------

Explore traceroute/tracert for different websites eg: google.com and analyse the parameters in the output and explore different options for traceroute command

Tracert:
-------

C:\Users\vsrir>tracert google.com

Tracing route to google.com [2404:6800:4007:81c::200e]
over a maximum of 30 hops:

  1     3 ms     1 ms     1 ms  2401:4900:1ce1:3414::1
  2    15 ms    24 ms    19 ms  2401:4900:1ce0:8fff::1
  3    13 ms    46 ms    10 ms  2404:a800:3a00:300::61
  4    17 ms    21 ms    19 ms  2404:a800::92
  5     *        *        *     Request timed out.
  6    19 ms    19 ms    18 ms  2404:6800:8108::1
  7     *       21 ms     *     2001:4860:0:1::564a
  8    23 ms    24 ms    23 ms  2001:4860:0:1::5663
  9    17 ms    19 ms    17 ms  maa05s21-in-x0e.1e100.net [2404:6800:4007:81c::200e]

Trace complete.


Traceroute/Tracert Overview:
-----------------------------

Traceroute (Linux) and tracert (Windows) are network diagnostic tools.
They are used to determine the path packets take from your host to a destination (e.g., google.com). 
They work by sending packets with gradually increasing Time-To-Live (TTL) values. 
Each router along the path decrements the TTL.
when the TTL reaches zero, the router returns an ICMP "Time Exceeded" message, revealing its presence.
This process builds a list of hops that the packets traverse.

Understanding the Output:
-------------------------

For each hop, traceroute/tracert typically displays:

Hop Number: Indicates the sequential order of the routers along the route.

IP Address/Hostname: Shows the responding router’s IP (and optionally its DNS-resolved hostname).

Response Times: Displays the round-trip time (RTT) for each probe sent to that hop (commonly in milliseconds).
There may be multiple RTT values per hop if multiple queries are sent.

Timeouts/Errors: If a hop does not respond, you might see a “*” indicating a timeout or unreachable hop.

Output Breakdown:
------------------------

Destination and Protocol:
The output indicates that the destination is google.com which resolves to an IPv6 address: 2404:6800:4007:81c::200e.
The route is traced using IPv6, as evident from the IPv6 addresses in each hop.

Hop Details:
Hop Number: Each line represents a sequential router (or hop) that the packet passes through. 

Round-Trip Times (RTT): Three RTT values (in milliseconds) are shown per hop.
These times indicate how long it took for each probe packet to travel to that hop and back.

IP Address/Hostname: The responding device’s address is shown. In hop 9, both the resolved hostname
(maa05s21-in-x0e.1e100.net) and its IPv6 address are displayed.

Timeouts: In hop 5 and partially in hop 7, the output shows * for some probes, indicating that those requests timed out.
This could be due to a router configured to not send ICMP Time Exceeded messages or temporary network congestion.

Interpreting Timeouts:
A timeout (indicated by *) doesn’t necessarily mean the network is down—it can simply be that a
particular router is configured to not respond to traceroute probes. The trace can still complete if subsequent hops reply.

Common Options for Traceroute/Tracert:
--------------------------------------

On Linux (using traceroute):
-m <max_ttl>: Set the maximum number of hops (default is often 30).
-q <nqueries>: Specify the number of probe packets per hop (default is typically 3).
-w <wait>: Set the timeout (in seconds) for each probe.
-I: Use ICMP Echo instead of UDP packets (default behavior for many Linux versions).
-T: Use TCP SYN packets for probing (useful when UDP is blocked).
-p <port>: Define the starting UDP port number.

On Windows (using tracert):
-h <max_hops>: Specify the maximum number of hops to search for the target.
-w <timeout>: Set the wait time (in milliseconds) for each reply.
-d: Prevent DNS resolution of addresses, displaying only numeric IP addresses.
-4 or -6: Force the use of IPv4 or IPv6.

```
