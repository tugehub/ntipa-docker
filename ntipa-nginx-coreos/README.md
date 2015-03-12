### To build:

	Spostarsi nella directory e lanciare il comando
    sudo docker build -t tornabene/ntipa-nginx .
    
### To run:
    sudo docker pull tornabene/ntipa-nginx
    
     sudo docker run  --rm  --dns 10.10.130.5  -p 8080:80 -p  -i  -t  tornabene/ntipa-nginx /bin/bash
     sudo docker run  -d  --dns 10.10.130.5    -P     tornabene/ntipa-nginx 
   
     sudo docker run  -d  -p 80:80     --name  ntipa --link box.ntipa.it:box.ntipa.it  --link oauth.ntipa.it:oauth.ntipa.it --link manager.ntipa.it:manager.ntipa.it --link protocollo.ntipa.it:protocollo.ntipa.it  tornabene/ntipa-nginx 
    

    
     