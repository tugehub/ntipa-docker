ntipa-docker
============

ntipa-docker


sudo mkdir -p /opt/ntipa/mongodb_data
sudo mkdir -p /opt/ntipa/postgresql_data
sudo mkdir -p /opt/ntipa/rabbitmq_data

sudo docker run  --name mongoamia    -p 27017:27017  -v  /opt/ntipa/mongodb_data:/data/db -d   tornabene/ntipa-mongodb  --journal
sudo docker run  --name postgresamia -p 5432:5432 -v  /opt/ntipa/postgresql_data:/var/lib/postgresql -d   tornabene/ntipa-postgres     
sudo docker run  --name rabbitmqamia -p 5672:5672 -p 15672:15672 -p 1522:22  -v /opt/ntipa/rabbitmq_data:/var/lib/rabbitmq/ntipa -d tornabene/ntipa-rabbitmq