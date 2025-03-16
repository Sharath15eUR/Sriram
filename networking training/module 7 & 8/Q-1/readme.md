```
Question:
-------

Try Test-Connection and nslookup commands for below websites
www.google.com
www.facebook.com
www.amazon.com
www.github.com
www.cisco.com


Answer:
-------

i) www.google.com
------------------

PS C:\Users\vsrir>  Test-Connection www.google.com -Count 4

Source        Destination     IPV4Address      IPV6Address                              Bytes    Time(ms)
------        -----------     -----------      -----------                              -----    --------
LAPTOP-EDD... www.google.com  142.250.205.228  2404:6800:4007:82d::2004                 32       18
LAPTOP-EDD... www.google.com  142.250.205.228  2404:6800:4007:82d::2004                 32       21
LAPTOP-EDD... www.google.com  142.250.205.228  2404:6800:4007:82d::2004                 32       21
LAPTOP-EDD... www.google.com  142.250.205.228  2404:6800:4007:82d::2004                 32       20

PS C:\Users\vsrir> nslookup www.google.com
Server:  dsldevice.lan
Address:  192.168.1.1

Non-authoritative answer:
Name:    www.google.com
Addresses:  2404:6800:4007:82d::2004
          142.250.205.228

PS C:\Users\vsrir>

ii) facebook.com
----------------

PS C:\Users\vsrir>  Test-Connection www.facebook.com -Count 4

Source        Destination     IPV4Address      IPV6Address                              Bytes    Time(ms)
------        -----------     -----------      -----------                              -----    --------
LAPTOP-EDD... www.facebook... 157.240.192.35   2a03:2880:f137:182:face:b00c:0:25de      32       21
LAPTOP-EDD... www.facebook... 157.240.192.35   2a03:2880:f137:182:face:b00c:0:25de      32       18
LAPTOP-EDD... www.facebook... 157.240.192.35   2a03:2880:f137:182:face:b00c:0:25de      32       21
LAPTOP-EDD... www.facebook... 157.240.192.35   2a03:2880:f137:182:face:b00c:0:25de      32       18


PS C:\Users\vsrir> nslookup facebook.com
Server:  dsldevice.lan
Address:  192.168.1.1

Non-authoritative answer:
Name:    facebook.com
Addresses:  2a03:2880:f184:186:face:b00c:0:25de
          163.70.139.35


iii) amazon.com
--------------------

PS C:\Users\vsrir>  Test-Connection www.amazon.com -Count 4

Source        Destination     IPV4Address      IPV6Address                              Bytes    Time(ms)
------        -----------     -----------      -----------                              -----    --------
LAPTOP-EDD... www.amazon.com  18.67.156.60     2600:9000:2241:be00:7:49a5:5fd4:b121     32       23
LAPTOP-EDD... www.amazon.com  18.67.156.60     2600:9000:2241:be00:7:49a5:5fd4:b121     32       24
LAPTOP-EDD... www.amazon.com  18.67.156.60     2600:9000:2241:be00:7:49a5:5fd4:b121     32       24
LAPTOP-EDD... www.amazon.com  18.67.156.60     2600:9000:2241:be00:7:49a5:5fd4:b121     32       27


PS C:\Users\vsrir> nslookup amazon.com
Server:  dsldevice.lan
Address:  192.168.1.1

Non-authoritative answer:
Name:    amazon.com
Addresses:  54.239.28.85
          205.251.242.103
          52.94.236.248

iv) github.com 
---------------

PS C:\Users\vsrir>  Test-Connection github.com -Count 4

Source        Destination     IPV4Address      IPV6Address                              Bytes    Time(ms)
------        -----------     -----------      -----------                              -----    --------
LAPTOP-EDD... github.com      20.207.73.82                                              32       42
LAPTOP-EDD... github.com      20.207.73.82                                              32       44
LAPTOP-EDD... github.com      20.207.73.82                                              32       43
LAPTOP-EDD... github.com      20.207.73.82                                              32       44


PS C:\Users\vsrir> nslookup github.com
Server:  dsldevice.lan
Address:  192.168.1.1

Non-authoritative answer:
Name:    github.com
Address:  20.207.73.82

v) cisco.com
-------------


PS C:\Users\vsrir>  Test-Connection cisco.com -Count 4

Source        Destination     IPV4Address      IPV6Address                              Bytes    Time(ms)
------        -----------     -----------      -----------                              -----    --------
LAPTOP-EDD... cisco.com       72.163.4.185     2001:420:1101:1::185                     32       338
LAPTOP-EDD... cisco.com       72.163.4.185     2001:420:1101:1::185                     32       254
LAPTOP-EDD... cisco.com       72.163.4.185     2001:420:1101:1::185                     32       291
LAPTOP-EDD... cisco.com       72.163.4.185     2001:420:1101:1::185                     32       817


PS C:\Users\vsrir> nslookup cisco.com
Server:  dsldevice.lan
Address:  192.168.1.1

Non-authoritative answer:
Name:    cisco.com
Addresses:  2001:420:1101:1::185
          72.163.4.185





```