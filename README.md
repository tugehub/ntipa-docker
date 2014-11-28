ntipa-docker
============

ntipa-docker per amia

sudo mkdir -p /opt/ntipa/mongodb_data
sudo mkdir -p /opt/ntipa/postgresql_data
sudo mkdir -p /opt/ntipa/rabbitmq_data

#SERVICE 
sudo docker run  --name mongoamia    -p 27017:27017  -v  /opt/ntipa/mongodb_data:/data/db -d   tornabene/ntipa-mongodb  --journal
sudo docker run  --name postgresamia -p 5432:5432 -v  /opt/ntipa/postgresql_data:/var/lib/postgresql -d   tornabene/ntipa-postgres     
sudo docker run  --name rabbitmqamia -p 5672:5672 -p 15672:15672 -p 1522:22  -v /opt/ntipa/rabbitmq_data:/var/lib/rabbitmq/ntipa -d tornabene/ntipa-rabbitmq
sudo docker run  --name solramia -p 8983:8983 -p 8922:22  -d tornabene/docker-solr

#API
sudo docker run -d --name ntipa-authserver-amia  -p 8443:8443  -p 8422:22 --link postgresamia:postgres.ntipa.it tornabene/ntipa-authserver

sudo docker run -d --name ntipa-manager-amia     -p 8081:8081  -p 8122:22 --link postgresamia:postgres.ntipa.it  --link rabbitmqamia:rabbitmq.ntipa.it --link solramia:solr.ntipa.it  --link  mongoamia:mongo.ntipa.it   --link ntipa-authserver-amia:oauth.ntipa.it  tornabene/ntipa-manager

sudo docker run -d --name ntipa-box-amia         -p 8333:8333  -p 8322:22 --link postgresamia:postgres.ntipa.it  --link rabbitmqamia:rabbitmq.ntipa.it --link solramia:solr.ntipa.it  --link  mongoamia:mongo.ntipa.it   --link ntipa-authserver-amia:oauth.ntipa.it --link ntipa-manager-amia:manager.ntipa.it    tornabene/ntipa-box
  
sudo docker run -d --name ntipa-protocollo-amia     -p 8080:8080  -p 8122:22 --link postgresamia:postgres.ntipa.it  --link rabbitmqamia:rabbitmq.ntipa.it --link solramia:solr.ntipa.it  --link  mongoamia:mongo.ntipa.it   --link ntipa-authserver-amia:oauth.ntipa.it --link ntipa-box-amia:box.ntipa.it  tornabene/ntipa-protocollo

  
#WEB
sudo docker run  -d  -p 80:80     --name  ntipa --link ntipa-box-amia:box.ntipa.it  --link ntipa-authserver-amia:oauth.ntipa.it --link ntipa-manager-amia:manager.ntipa.it    tornabene/ntipa-nginx 