map $http_upgrade $connection_upgrade {
    default upgrade;
    '' close;
}

upstream dev_gestatto {
        server 192.168.111.38:8080;
}

upstream dev_convert {
        server 192.168.111.38:12002;
}

upstream dev_camunda {
        server 192.168.111.38:8083;
	server 192.168.111.38:8082;
}


server {
        listen 80;
        server_name cifra.ntipa.com;

         #location / {
         #   proxy_pass http://dev_gestatto;
         #   proxy_redirect off;
         #   proxy_set_header        Host            $host;
         #   proxy_set_header        X-Real-IP       $remote_addr;
         #   proxy_set_header        X-Forwarded-For $proxy_add_x_forwarded_for;
         #   proxy_set_header        X-NginX-Proxy   true;
         #   proxy_http_version 1.1;
         #   proxy_set_header Upgrade $http_upgrade;
         #   proxy_set_header Connection $connection_upgrade;
         # }

	location /camunda {
            proxy_pass http://dev_camunda/camunda;
            proxy_redirect off;
            proxy_set_header        Host            $host;
            proxy_set_header        X-Real-IP       $remote_addr;
            proxy_set_header        X-Forwarded-For $proxy_add_x_forwarded_for;
            proxy_set_header        X-NginX-Proxy   true;
            proxy_http_version 1.1;
            proxy_set_header Upgrade $http_upgrade;
            proxy_set_header Connection $connection_upgrade;
          }

         location /convert {
            proxy_pass http://dev_convert/convert;
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
