```

What is iperf?:
----------------

Iperf is an open source network performance measurement tool that tests throughput in IP networks.
To do so, it generates network traffic from one host, the iperf client, to another, the iperf server.
Iperf not only measures the amount of traffic that is transferred, but also report performance metrics such as latency,
packet loss, and jitter. This network performance management tool works for both TCP and UDP traffic with certain
nuances that pertain to the specifics of each protocol. In UDP mode it can also generate multicast traffic.


Usage:
------

In iperf, the host that sends the traffic is called client and the host that receives traffic is called server.
Here is how the command line output looks for the two versions and for UDP and TCP tests, at their basic forms without any advanced options. Important to note is that in version 2, the default port where the server is listening is 5001 for both TCP and UDP protocols,
while in version 3, the default port where the server is listening is 5201 for both protocols.


To run the iperf server using the Transmission Control Protocol, use the flag -s (iperf -s):

$ iperf -s
------------------------------------------------------------
Server listening on TCP port 5001
TCP window size: 85.3 KByte (default)
------------------------------------------------------------
[  4] local 172.31.0.25 port 5001 connected with 172.31.0.17 port 55082
[ ID] Interval       Transfer     Bandwidth
[  4]  0.0-10.0 sec  1.09 GBytes   39 Mbits/sec


TCP:
----
To run the iperf in client mode use the flag -c followed by the server’s IP address:

$ iperf -c 172.31.0.25
------------------------------------------------------------
Client connecting to 172.31.0.25, TCP port 5001
TCP window size: 85.0 KByte (default)
------------------------------------------------------------
[  3] local 172.31.0.17 port 55082 connected with 172.31.0.25 port 5001
[ ID] Interval       Transfer     Bandwidth
[  3]  0.0-10.0 sec  1.09 GBytes   40 Mbits/sec

UDP:
---
To run the iperf2 server using the User Datagram Protocol you must add the flag -u that stands for UDP (iperf -s -u):

$ iperf -s -u
------------------------------------------------------------
Server listening on UDP port 5001
Receiving 1470 byte datagrams
UDP buffer size:  208 KByte (default)
------------------------------------------------------------
[  3] local 172.31.0.25 port 5001 connected with 172.31.0.17 port 54581
[ ID] Interval       Transfer     Bandwidth        Jitter   Lost/Total Datagrams
[  3]  0.0-10.0 sec  1.25 MBytes  1.05 Mbits/sec   0.022 ms    0/  893 (0%)


```
