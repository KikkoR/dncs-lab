#COMMON
export DEBIAN_FRONTEND=noninteractive
sudo su
apt-get update
apt-get install -y tcpdump --assume-yes

#2
ip add add 192.168.2.2/23 dev enp0s8
ip link set enp0s8 up

ip route del default

#3
ip route add default via 192.168.2.1