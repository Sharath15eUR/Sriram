```

Question:
--------
i)   Simulate a small network with swtches and multiple devices. 
ii)  Use ping to generate traffic and observe the MAC address table of the switch. 
iii) Capture and analyze that ethernet frames.

used software:
---------------
Cisco packet tracer

Attached simulation file:
-----------------------
Q-1.pkt

Note:
-----
MAC table entries have MACs of connected switch interfaces due to the default support of
STP and DTP in switches in packet tracer.

Answer:
-------
i) Simulate a small network with swtches and multiple devices: 

The topology chosen for this answer is given below
```
![alt text](images/image-1.png)

```
ii) Use ping to generate traffic and observe the MAC address table of the switch. 

Generated multiple PDU of ICMP packets from PC0 to PC1 (only first ICMP capture of PC0 to PC1 is shown for simplicity)

```
![icmp captures](images/image-2.png) 

```
ii) observe the MAC address table of the switches.

Note:
----
The below MAC table is captured after multiple ICMP pings and STP broadcasts

```
![MAC table captures](images/image.png) 

```
iii) Capture and analyze that ethernet frames.

An outbound PDU of ICMP has been captured by the CPT sim-panel and its details with packet structure is given here.

```
![protocol stack](images/image_copy.png) 
![packet struct](images/image_copy_1.png)
