# MachineConfig
## NetworkConfig
--- Network configuration scripts for the real world testing setup. ---

For validation and calibration, four servers are used.
They are all connected to a switch with 10Gbit links each.
To limit the bandwitdh of all three "workers", the fourth machine serves as a gateway for the others.
Each server gets an additional local ip address (192.168.100.10X).
So all the traffic is redirected through the gateway to be limited to 10, 1 or 0.1Gbit/s (combined).
The speed can be set by executing
```bash
set_gatewaySpeed.sh <SPEED>
```
where `<SPEED>` is `10000`, `1000` or `100`.
The routing ist implemented as SNAT rule in iptables.

## PermissionConfig

In order to be able to clear the page cache between validation runs to recover a clear machine setup,
`root` permissions for execution of the `clearPageCache.sh` script must be assigned to the user 
executing the measurements.
Of course, the `clearPageCache.sh` script must first be placed somewhere on the machine.
To enable it execute:
```bash
setup_sudoers.sh <USER> <PATH_TO>/clearPageCache.sh
```
This script can then be called by the user `<USER>` to wipe the page cache of the machine by the user with:
```bash
sudo <PATH_TO>/clearPageCache.sh`
```
