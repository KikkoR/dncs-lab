export DEBIAN_FRONTEND=noninteractive
apt-get update
apt-get install -y tcpdump
apt-get install -y openvswitch-common openvswitch-switch apt-transport-https ca-certificates curl software-properties-common

# 2
ovs-vsctl add-br switch

# 3
ovs-vsctl add-port switch enp0s8
ip link set enp0s8 up

# 4
ovs-vsctl add-port switch enp0s9 tag=9
ip link set enp0s9 up

# 5
ovs-vsctl add-port switch enp0s10 tag=10
ip link set enp0s10 up
