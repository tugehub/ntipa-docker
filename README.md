ntipa-docker
============

http://cloud.ntipa.com


Il Document management system (DMS), letteralmente "Sistema di gestione dei documenti" è una categoria di sistemi software che serve a organizzare e facilitare la creazione collaborativa di documenti e di altri contenuti.

#Ultima versione di docker su ubuntu 14.04 con estensione aufs

sudo apt-get update
sudo apt-get -y install linux-image-extra-$(uname -r)
sudo sh -c "wget -qO- https://get.docker.io/gpg | apt-key add -"
sudo sh -c "echo deb http://get.docker.io/ubuntu docker main\ > /etc/apt/sources.list.d/docker.list"
sudo apt-get update
sudo apt-get -y install lxc-docker


