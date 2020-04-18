export DEBIAN_FRONTEND=noninteractive

sudo su
apt-get update

# 1
apt-get install -y apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
apt-get update
apt-get install -y docker-ce

# 2
docker system prune -a
docker run --name ServerDocker -p 80:80 -d dustnic82/nginx-test

# 3

ip link set enp0s8 up

ip addr add 192.168.6.2/23 dev enp0s8



# 4
ip route add 192.168.2.0/23 via 192.168.6.1

ip route add 192.168.4.0/24 via 192.168.6.1
