ntipa-tidocker
============

##ntipa-tidocker per amia

#CANCELLA TUTTI I DATI
sudo rm -fr /opt/ntipa

sudo mkdir -p /opt/ntipa/mongodb_data
sudo mkdir -p /opt/ntipa/postgresql_data
sudo mkdir -p /opt/ntipa/rabbitmq_data

#Stoppare tutti i contenitori
sudo docker rm -f mongoamia postgresamia rabbitmqamia solramia ntipa-authserver-amia ntipa-manager-amia ntipa-box-amia  ntipa-nginx-amia


#SERVICE 
sudo docker run  --name mongoamia    -p 27017:27017  -v  /opt/ntipa/mongodb_data:/data/db -tid   tornabene/ntipa-mongodb  --journal
sudo docker run  --name postgresamia -p 5432:5432 -v  /opt/ntipa/postgresql_data:/var/lib/postgresql -tid   tornabene/ntipa-postgres     
sudo docker run  --name rabbitmqamia -p 5672:5672 -p 15672:15672 -p 1522:22  -v /opt/ntipa/rabbitmq_data:/var/lib/rabbitmq/ntipa -tid tornabene/ntipa-rabbitmq
sudo docker run  --name solramia -p 8983:8983 -p 8922:22  -tid tornabene/docker-solr

#Per entrare nelle istanze senza ssh usare:
##	sudo docker exec container comando 
##	importante fare partire in container con l'opzione -tid oppure su fleet con -ti

#API
sudo docker run -tid --name ntipa-authserver-amia  -p 8443:8443  -p 8422:22 --link postgresamia:postgres.ntipa.it tornabene/ntipa-authserver

sudo docker run -tid --name ntipa-manager-amia     -p 8081:8081  -p 8122:22 --link postgresamia:postgres.ntipa.it  --link rabbitmqamia:rabbitmq.ntipa.it --link solramia:solr.ntipa.it  --link  mongoamia:mongo.ntipa.it   --link ntipa-authserver-amia:oauth.ntipa.it  tornabene/ntipa-manager

sudo docker run -tid --name ntipa-box-amia         -p 8333:8333  -p 8322:22 --link postgresamia:postgres.ntipa.it  --link rabbitmqamia:rabbitmq.ntipa.it --link solramia:solr.ntipa.it  --link  mongoamia:mongo.ntipa.it   --link ntipa-authserver-amia:oauth.ntipa.it --link ntipa-manager-amia:manager.ntipa.it    tornabene/ntipa-box
  
#sudo docker run -tid --name ntipa-protocollo-amia     -p 8080:8080  -p 8122:22 --link postgresamia:postgres.ntipa.it  --link rabbitmqamia:rabbitmq.ntipa.it --link solramia:solr.ntipa.it  --link  mongoamia:mongo.ntipa.it   --link ntipa-authserver-amia:oauth.ntipa.it --link ntipa-box-amia:box.ntipa.it  tornabene/ntipa-protocollo

  
#WEB
sudo docker run   -p 80:80     --name  ntipa-nginx-amia --link ntipa-box-amia:box.ntipa.it  --link ntipa-authserver-amia:oauth.ntipa.it --link ntipa-manager-amia:manager.ntipa.it --link ntipa-box-amia:protocollo.ntipa.it  -tid tornabene/ntipa-nginx 