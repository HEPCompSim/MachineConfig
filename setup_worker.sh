if [ -z "$1" ]
then
                        echo "usage: ./setup_worker.sh <IP's last digit>"
                                                exit -1
fi

#deactivate ip v6 in /etc/sysctl.conf on all machines
#echo "net.ipv6.conf.all.disable_ipv6 = 1" >> /etc/sysctl.conf
#echo "net.ipv6.conf.default.disable_ipv6 = 1" >> /etc/sysctl.conf
sysctl -w net.ipv6.conf.default.disable_ipv6=1
sysctl -w net.ipv6.conf.all.disable_ipv6=1
#sysctl -p  # apply
#systemctl restart systemd-networkd

### Add local ip address:
ip addr add 192.168.1.10$1/24 dev enp4s0 label enp4s0:0

# add default gateway:
route replace default gw 192.168.1.100 enp4s0
# remove old default gateway:
#route del default gw 129.13.101.1 dev enp4s0

# mount condor
#mount /dev/md0 /local/scratch/condor

#For testing:
echo "gateway:"
route # 192.168.1.100 has to be default gateway
echo "My ip from outside is:"
curl ifconfig.me # has to be 148
