docker-mongodb
==============

### Learning Docker http://docker.io/ by creating a mongodb replica container.

### To build:

	Spostarsi nella directory e lanciare il comando
    sudo docker build -t tornabene/ntipa-mysql .
### To run:

    sudo docker pull tornabene/ntipa-mysql
    sudo mkdir -p /opt/ntipa/mysql_data
    
     sudo docker exec -ti mysql /bin/bash
     
    
   sudo rm -rf /opt/ntipa/mysql_data
   sudo mkdir -p /opt/ntipa/mysql_data
   sudo docker run -tid --name mysql -v   /opt/ntipa/mysql_data:/var/lib/mysql -p 3306:3306 -e MYSQL_USER="admin"  -e MYSQL_PASS="12345678"  tornabene/ntipa-mysql
	  
 