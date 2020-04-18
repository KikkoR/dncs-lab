export DEBIAN_FRONTEND=noninteractive
sudo su
apt-get update

# 1
apt-get install -y tcpdump --assume-yes

# 2
ip add add 192.168.4.2/24 dev enp0s8
ip link set enp0s8 up

# 3
ip route del default

# 4
ip route add default via 192.168.4.1