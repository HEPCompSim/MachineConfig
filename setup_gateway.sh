# Deactivate ip v6 in /etc/sysctl.conf on all machines
echo "net.ipv6.conf.all.disable_ipv6 = 1" >> /etc/sysctl.conf
echo "net.ipv6.conf.default.disable_ipv6 = 1" >> /etc/sysctl.conf
echo "net.ipv4.ip_forward = 1" >> /etc/sysctl.conf

sysctl -p  # apply

# Add ip
ip addr add 192.168.1.100/24 dev enp4s0 label enp4s0:0
# Enable routing
iptables -t nat -A POSTROUTING -o enp4s0 -j SNAT --to 129.13.101.148 #SNAT

# For testing:
iptables -t nat -nvL # SNAT
