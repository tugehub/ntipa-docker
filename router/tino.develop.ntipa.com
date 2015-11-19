map $http_upgrade $connection_upgrade {
    default upgrade;
    '' close;
}



upstream dev_tino {
	server 10.10.130.69:3000;
}

upstream dev_camunda_tino {
        server 10.10.130.69:8083;
	server 10.10.130.69:8082;
}



server{

        listen 80 ;
        #listen [::]:80 ipv6only=on;
        server_name tino.develop.ntipa.com;

	 location / {
            proxy_pass http://dev_tino;
            proxy_redirect off;
            proxy_set_header        Host            $host;
            proxy_set_header        X-Real-IP       $remote_addr;
            proxy_set_header        X-Forwarded-For $proxy_add_x_forwarded_for;
            proxy_set_header        X-NginX-Proxy   true;
            proxy_http_version 1.1;
            proxy_set_header Upgrade $http_upgrade;
            proxy_set_header Connection $connection_upgrade;
          }

        location /camunda {
            proxy_pass http://dev_camunda_tino/camunda;
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

