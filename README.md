# NetworkConfig
--- Network configuration scripts for the real world testing setup. ---

For validation and calibration, four servers are used.
They are all connected to a switch with 10Gbit links each.
To limit the bandwitdh of all three "workers", the fourth machine serves as a gateway for the others.
Each server gets an additional local ip address (192.168.100.10X).
So all the traffic is redirected through the gateway to be limited to 10Gbit/s (combined).
The routing ist implemented as SNAT rule in iptables.
