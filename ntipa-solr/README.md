docker-solr
===========


### To build:
	Spostarsi nella directory e lanciare il comando
    sudo docker build -t tornabene/ntipa-solr .
    

### To run:

    sudo docker pull tornabene/docker-solr
    sudo docker run -ti    -p 8983:8983  -v /opt/ntipa/solr_data:/opt/solr/example/solr/ntipa/data/  tornabene/ntipa-solr
    
    
    