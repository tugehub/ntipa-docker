ntipa-docker
============

http://cloud.ntipa.com


Il Document management system (DMS), letteralmente "Sistema di gestione dei documenti" è una categoria di sistemi software che serve a organizzare e facilitare la creazione collaborativa di documenti e di altri contenuti.

#Ultima versione di docker su ubuntu 14.04 con estensione aufs

`sudo apt-get update`

`sudo apt-get -y install linux-image-extra-$(uname -r)`

`sudo sh -c "wget -qO- https://get.docker.io/gpg | apt-key add -"`

`sudo sh -c "echo deb http://get.docker.io/ubuntu docker main\ > /etc/apt/sources.list.d/docker.list"`

`sudo apt-get update`

`sudo apt-get -y install lxc-docker`


#Cluster Docker con swarm

#Modificare  il file /etc/default/docker con il contenuto sottostante
`DOCKER_TLS_VERIFY=0`

`DOCKER_OPTS="-H tcp://127.0.0.1:4243  -H tcp://0.0.0.0:2375  -H unix:///var/run/docker.sock --insecure-registry 192.168.111.34:5000"`

#Riavviare docker service daemon

##Lanciare su tutti i nodi fa partire agent

`sudo docker run -d swarm join --addr=10.10.130.69:2375 token://1885d1b61666adb81832c89f6b009195`

##Dopo aver lancato tutti gli agent si puo procedere con aggancio del manager per vedere i nuovo agent bosigna riavviare i manager

`sudo docker run -d -p 12375:2375 swarm manage token://1885d1b61666adb81832c89f6b009195`

`sudo docker -H tcp://10.10.130.69:12375 info`
`sudo docker -H tcp://10.10.130.69:12375 run --name cifra2-mysql -p 13306:3306 -v /opt/cifra2/mysql:/var/lib/mysql  -e MYSQL_ROOT_PASSWORD=admin -d mysql:5.6`


