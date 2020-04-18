export DEBIAN_FRONTEND=noninteractive
sudo su
apt-get update

# 1
apt-get install -y tcpdump --assume-yes

# 2
sysctl net.ipv4.ip_forward=1 

# 3
ip link set enp0s8 up
ip link set enp0s9 up
ip addr add 192.168.6.1/22 dev enp0s8
ip addr add 192.168.10.2/30 dev enp0s9


# 4
ip route del default

# 5 
ip route add 192.168.2.0/23 via 192.168.10.1 dev enp0s9

ip route add 192.168.4.0/24 via 192.168.10.1 dev enp0s9
