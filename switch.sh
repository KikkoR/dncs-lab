#CONFIGURATIONS

export DEBIAN_FRONTEND=noninteractive
apt-get update
apt-get install -y tcpdump
apt-get install -y openvswitch-common openvswitch-switch apt-transport-https ca-certificates curl software-properties-common

# 1 Create a new bridge "switch"
ovs-vsctl add-br switch

#2 Create a trunk port and set interface up
ovs-vsctl add-port switch enp0s8
ip link set enp0s8 up

#3 Add port on the switch with tag 9 and 10
ovs-vsctl add-port switch enp0s9 tag=9
ip link set enp0s9 up
ovs-vsctl add-port switch enp0s10 tag=10
ip link set enp0s10 up
