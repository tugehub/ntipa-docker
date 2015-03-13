ntipa-docker
============
##Installazione ultima versione di docker
`sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 36A1D7869245C8950F966E92D8576A8BA88D21E9`

`sudo sh -c "echo deb https://get.docker.io/ubuntu docker main > /etc/apt/sources.list.d/docker.list"`

`sudo apt-get update`

`sudo apt-get install lxc-docker`

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


sudo mkfs.ext4 /dev/vdb1
echo "/dev/vdb1    /opt    ext4    defaults    0    1" >> /etc/fstab
##ntipa-tidocker per amia

#CANCELLA TUTTI I DATI
sudo rm -fr /opt/ntipa

`sudo mkdir -p /opt/ntipa/mongodb_data`
`sudo mkdir -p /opt/ntipa/postgresql_data`
`sudo mkdir -p /opt/ntipa/rabbitmq_data`


vi /etc/default/docker
DOCKER_OPTS="-H tcp://127.0.0.1:4243 -H unix:///var/run/docker.sock"sudo servi	

export DOCKER_HOST=tcp://localhost:4243


  
#REVERSY PROXY
`sudo docker run   -p 80:80     --name  ntipa-nginx-amia --link ntipa-box-amia:box.ntipa.it  --link ntipa-authserver-amia:oauth.ntipa.it --link ntipa-manager-amia:manager.ntipa.it --link ntipa-box-amia:protocollo.ntipa.it  -tid tornabene/ntipa-nginx`
