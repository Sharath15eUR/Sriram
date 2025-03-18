```
question 13:
------------
Try Static NAT, Dynamic NAT and PAT to translate IPs

Answer:
-------

Dynamic NAT:
----------- 

used topology...
```
![alt text](images/image.png)
```
outbound pdu with translated IP address ...
```
![alt text](images/image-1.png)

```
dynamic nat table of router0 ...

```
![alt text](images/image-2.png)


```
PAT implementation for the same network on interface Gig 0/1 ...

```
![alt text](images/image-4.png)
![alt text](images/image-3.png)

```
SNAT implementation on Gig0/1...
```
![alt text](images/image-5.png)
![alt text](images/image-6.png)