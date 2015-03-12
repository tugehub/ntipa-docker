ntipa-docker
============
##Installazione ultima versione di docker
`sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 36A1D7869245C8950F966E92D8576A8BA88D21E9`

`sudo sh -c "echo deb https://get.docker.io/ubuntu docker main > /etc/apt/sources.list.d/docker.list"`

`sudo apt-get update`

`sudo apt-get install lxc-docker`


curl -L https://github.com/docker/compose/releases/download/1.1.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

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

#Stoppare tutti i contenitori
sudo docker rm -f mongocloud postgrescloud rabbitmqcloud  solrcloud   managercloud boxcloud  nginxcloud


#SERVICE 

`sudo docker run  --name mongocloud    -p 27017:27017  -v  /opt/ntipa/mongodb_data:/data/db -tid   tornabene/ntipa-mongodb  --journal`

`sudo docker run  --name postgrescloud -p 5432:5432 -v  /opt/ntipa/postgresql_data:/var/lib/postgresql -tid   tornabene/ntipa-postgres`

`sudo docker run  --name rabbitmqcloud -p 5672:5672 -p 15672:15672 -p 1522:22 -p 61613:61613  -p 25672:25672 -p 4369:4369 -v /opt/ntipa/rabbitmq_data:/var/lib/rabbitmq/ntipa -tid tornabene/ntipa-rabbitmq`

`sudo docker run  --name solrcloud -p 8983:8983 -p 8922:22  -tid tornabene/docker-solr`

###sudo docker run  --name voip  -tid ksoichiro/freeswitch

#Per entrare nelle istanze senza ssh usare:
##	sudo docker   exec -ti container comando 
##	importante fare partire in container con l'opzione -tid oppure su fleet con -ti

#API NTIPA SERVICE(box,register,time,manager,websocketnotify,fuel,street,efatture)

`sudo docker run -tid --name ntipa-manager-amia     -p 8081:8081  -p 8122:22 --link postgresamia:postgres.ntipa.it  --link rabbitmqamia:rabbitmq.ntipa.it --link solramia:solr.ntipa.it  --link  mongoamia:mongo.ntipa.it   --link ntipa-authserver-amia:oauth.ntipa.it  tornabene/ntipa-manager`

`sudo docker run -tid --name ntipa-box-amia         -p 8333:8333  -p 8322:22 --link postgresamia:postgres.ntipa.it  --link rabbitmqamia:rabbitmq.ntipa.it --link solramia:solr.ntipa.it  --link  mongoamia:mongo.ntipa.it   --link ntipa-authserver-amia:oauth.ntipa.it --link ntipa-manager-amia:manager.ntipa.it    tornabene/ntipa-box`
  
`sudo docker run -tid --name ntipa-protocollo-amia     -p 8080:8080  -p 8122:22 --link postgresamia:postgres.ntipa.it  --link rabbitmqamia:rabbitmq.ntipa.it --link solramia:solr.ntipa.it  --link  mongoamia:mongo.ntipa.it   --link ntipa-authserver-amia:oauth.ntipa.it --link ntipa-box-amia:box.ntipa.it  tornabene/ntipa-protocollo`

  
#REVERSY PROXY
`sudo docker run   -p 80:80     --name  ntipa-nginx-amia --link ntipa-box-amia:box.ntipa.it  --link ntipa-authserver-amia:oauth.ntipa.it --link ntipa-manager-amia:manager.ntipa.it --link ntipa-box-amia:protocollo.ntipa.it  -tid tornabene/ntipa-nginx`
