sudo -i
echo "127.0.0.1  "`hostname` >> /etc/hosts
# Setup
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv E56151BF
DISTRO=$(lsb_release -is | tr '[:upper:]' '[:lower:]')
CODENAME=$(lsb_release -cs)

# Add the repository
echo "deb http://repos.mesosphere.io/${DISTRO} ${CODENAME} main" | \
  sudo tee /etc/apt/sources.list.d/mesosphere.list
sudo apt-get -y update
sudo apt-get -y install mesos marathon

echo "69" > /etc/zookeeper/conf/myid

echo "server.1=192.168.111.18:2888:3888" >> /etc/zookeeper/conf/zoo.cfg
echo "server.2=192.168.111.19:2888:3888" >> /etc/zookeeper/conf/zoo.cfg
echo "server.3=192.168.111.20:2888:3888" >> /etc/zookeeper/conf/zoo.cfg


sudo service zookeeper restart

echo "zk://192.168.111.18:2181,192.168.111.19:2181,192.168.111.20:2181/mesos" >  /etc/mesos/zk


