ntipa-docker
============

 



##Installazione ultima versione di docker

sudo apt-get update
sudo apt-get upgrade
sudo apt-get -y install linux-image-extra-$(uname -r)

###Per karma test maven problem  senza interfaccia grafica per buildare senza interfaccia grafica
sudo apt-get -y install libfontconfig linux-image-extra-$(uname -r)
 
curl -sSL https://get.docker.com/ubuntu/ | sudo sh
curl -L https://github.com/docker/compose/releases/download/1.1.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

 /opt/ntipa/
 
##Su openstack
#sudo -i
#echo "127.0.0.1  "`hostname` >> /etc/hosts



## Seavete disci 
sudo fdisk /dev/vdb
Command (m for help): n                                                      
Command action                                                               
   e   extended                                                              
   p   primary partition (1-4)                                               
p                                                                            
Partition number (1-4): 1                                                    
First cylinder (197-621, default 197):                               
Using default value 197                                                      
Last cylinder or +size or +sizeM or +sizeK (197-621, default 621): +128M
Now to write the new partion and exit, press w and enter.
You should be ready to make a filesystem now.

sudo apt-get install xfsprogs
sudo mkfs.xfs /dev/vdb1

sudo mkfs.ext4 /dev/vdb1

echo "/dev/vdb1    /opt    ext4    defaults    0    1" >> /etc/fstab
echo "/dev/vdb1    /opt    xfs    defaults    0    1" >> /etc/fstab
##ntipa-tidocker per amia

#CANCELLA TUTTI I DATI
##ATTENZIONE CANELLA CONTAINER E IMAGES RELATIVAMENTE 
 #!/bin/bash
# Delete all containers
docker rm $(docker ps -a -q)
# Delete all images
docker rmi $(docker images -q)


	`sudo rm -fr /opt/ntipa`
	
 	`lsbl	`
 	
 	`sudo mkdir -p /opt/ntipa/postgresql_data`
 	
 	`sudo mkdir -p /opt/ntipa/rabbitmq_data`
 	
 	`sudo mkdir -p /opt/ntipa/rabbitmq_log`
 	
 	`sudo chmod 777 /opt/ntipa/rabbitmq_data`
 	
 	`sudo chmod 777 /opt/ntipa/rabbitmq_log`
 	
	`sudo  mkdir -p /opt/ntipa/redis_data`	



sudo docker run --name ntipa-redis -tid -p 6379:6379 -v /opt/ntipa/redis_data:/data  redis redis-server --appendonly yes
