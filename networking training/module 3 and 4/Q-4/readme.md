```
Q-4:
----
Troubleshoot coneectivity with ping and traceroute.


Software used:
--------------
cisco packet tracer

Topology used:
-------------

```
![alt](images/image.png)
```
Problem:
-------
ping from pc0 to pc1 fails.... lets trouble shoot...

Troubleshooting;
---------------

-> try tracert from pc0 to pc3 

```
![](images/image%20copy.png)

```
since the default gateway is reachable and others are not lets go to router 1
and ping the neighbouring interfaces and check routing tables 

```
![](images/image%20copy%202.png) 

```
The routing table of router1 is found as above. It is found that no route the destination network available and thus adding a static entry to the destination net and modifying the same on the other side ...

```
![](images/image%20copy%204.png)
![](images/image%20copy%203.png)

```
thus it is trouble shooted and the network has been properly configured

```
