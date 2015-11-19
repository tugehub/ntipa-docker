map $http_upgrade $connection_upgrade {
    default upgrade;
    '' close;
}



upstream gricco {
	server 10.10.130.27:9000;
}

server {
        listen 80 ;
        #listen [::]:80 ipv6only=on;
        server_name gricco.develop.ntipa.com;

	 location / {
            proxy_pass http://gricco;
            proxy_redirect off;
            proxy_set_header        Host            $host;
            proxy_set_header        X-Real-IP       $remote_addr;
            proxy_set_header        X-Forwarded-For $proxy_add_x_forwarded_for;
            proxy_set_header        X-NginX-Proxy   true;
            proxy_http_version 1.1;
            proxy_set_header Upgrade $http_upgrade;
            proxy_set_header Connection $connection_upgrade;
          }

        

}

