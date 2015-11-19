map $http_upgrade $connection_upgrade {
    default upgrade;
    '' close;
}

upstream docker-registry {
        server 192.168.111.34:5000;
}

server {
        listen 443;
        ssl on;
	server_name registry.ntipa.com;
	ssl_certificate /etc/nginx/dev-docker-registry.com.crt;
	ssl_certificate_key /etc/nginx/dev-docker-registry.com.key;

         proxy_set_header Host       $http_host;   # required for Docker client sake
         proxy_set_header X-Real-IP  $remote_addr; # pass on real client IP

         client_max_body_size 0; # disable any limits to avoid HTTP 413 for large image uploads

         # required to avoid HTTP 411: see Issue #1486 (https://github.com/dotcloud/docker/issues/1486)
         chunked_transfer_encoding on;


         location / {
             # let Nginx know about our auth file
             auth_basic              "Restricted";
             auth_basic_user_file    /etc/nginx/docker-registry.htpasswd;

             proxy_pass http://docker-registry;
         }

         location /_ping {
             auth_basic off;
             proxy_pass http://docker-registry;
         }

         location /v1/_ping {
             auth_basic off;
             proxy_pass http://docker-registry;
         }

}

server {
        listen 80 ;
	server_name registry.ntipa.com;

	 proxy_set_header Host       $http_host;   # required for Docker client sake
	 proxy_set_header X-Real-IP  $remote_addr; # pass on real client IP

	 client_max_body_size 0; # disable any limits to avoid HTTP 413 for large image uploads

	 # required to avoid HTTP 411: see Issue #1486 (https://github.com/dotcloud/docker/issues/1486)
	 chunked_transfer_encoding on;


	 location / {
	     # let Nginx know about our auth file
	     auth_basic              "Restricted";
	     auth_basic_user_file    /etc/nginx/docker-registry.htpasswd;

	     proxy_pass http://docker-registry;
	 }

	 location /_ping {
	     auth_basic off;
	     proxy_pass http://docker-registry;
	 }  

	 location /v1/_ping {
	     auth_basic off;
	     proxy_pass http://docker-registry;
	 }

}
                                                                                                                                              
