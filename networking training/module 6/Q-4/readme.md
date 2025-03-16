```
Question:
---------
You are given three IP addresses: 192.168.10.5, 172.20.15.1, and 8.8.8.8.
Identify the class of each IP address.
Determine if it is private or public.
Explain how NAT would handle a private IP when accessing the internet.

Ans:
----

IP:
---

IP Address: 192.168.10.5
Class: Class C (The first octet, 192, is between 192 and 223)
Private or Public: Private (falls within the reserved range 192.168.0.0 – 192.168.255.255)

IP Address: 172.20.15.1
Class: Class B (The first octet, 172, is between 128 and 191)
Private or Public: Private (falls within the reserved range 172.16.0.0 – 172.31.255.255)

IP Address: 8.8.8.8
Class: Class A (The first octet, 8, is between 1 and 126)
Private or Public: Public (8.8.8.8 is a public IP address, commonly known as Google’s DNS server)

NAT:
----
Network Address Translation (NAT) 

Purpose of NAT:
---------------

NAT (Network Address Translation) allows devices on a private network (using private IP addresses) to access the internet using a public IP address. This is essential because private IP addresses are not routable on the public internet.

How NAT Works:
-------------

Outbound Traffic:
When a device with a private IP (e.g., 192.168.10.5) initiates a connection to an external server, 
the router with NAT changes the source IP address in the packet header from the private IP to its own public IP address.
The router also replaces the source port with a unique port number and records this mapping (private IP:port ⇔ public IP:port) in its NAT table.

Inbound Traffic:
When a response is received from the internet, the packet is addressed to the router’s public IP and the unique port number.
The NAT router looks up the mapping in its table, translates the destination IP and port back to the original private IP and port, and forwards the packet to the corresponding device.

Benefits of NAT:
Conservation of Public IP Addresses: Multiple devices can share a single public IP address.
Security: The internal network structure is hidden from external networks, reducing the attack surface.

```