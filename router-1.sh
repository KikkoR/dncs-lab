#CONFIGURATIONS

export DEBIAN_FRONTEND=noninteractive
sudo su
apt-get update
apt-get install -y tcpdump --assume-yes
sysctl net.ipv4.ip_forward=1

#1
ip add add 192.168.10.1/30 dev enp0s9
ip link set enp0s9 up

#2
ip link add link enp0s8 name enp0s8.9 type vlan id 9
ip add add 192.168.2.1/23 dev enp0s8.9
ip link add link enp0s8 name enp0s8.10 type vlan id 10
ip add add 192.168.4.1/24 dev enp0s8.10

ip link set enp0s8 up
ip link set enp0s8.9 up
ip link set enp0s8.10

ip route del default

#3
ip route add 192.168.6.0/23 via 192.168.10.2 dev enp0s9