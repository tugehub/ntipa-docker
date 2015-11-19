map $http_upgrade $connection_upgrade {
    default upgrade;
    '' close;
}
#si devono scoprire da soli

#si devono scoprire da soli


upstream store_prod {
        server 10.10.130.124:8080;
}


upstream manager_prod {
        server 192.168.111.37:8081;
}

upstream protocollo_prod {
#	server 192.168.111.37:8333;
        server 192.168.111.37:8080;
}

upstream box_prod {
        server 192.168.111.37:8333;
}


upstream camunda_cloud_prod {
        server 192.168.111.37:8082;
}


upstream store_cloud_prod {
        server 192.168.111.37:8085;
}

server {
        listen 443;
        ssl on;
	server_name cloud.ntipa.com;
	ssl_certificate /etc/nginx/cacert.cloud.ntipa.com.pem;
	ssl_certificate_key /etc/nginx/cloud.ntipa.com.pem;
	proxy_set_header X-Forwarded-For $remote_addr;


	location / {
            proxy_pass http://box_prod/box;
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
            proxy_pass http://camunda_cloud_prod/camunda;
            proxy_redirect off;
            proxy_set_header        Host            $host;
            proxy_set_header        X-Real-IP       $remote_addr;
            proxy_set_header        X-Forwarded-For $proxy_add_x_forwarded_for;
            proxy_set_header        X-NginX-Proxy   true;
            proxy_http_version 1.1;
            proxy_set_header Upgrade $http_upgrade;
            proxy_set_header Connection $connection_upgrade;
          }


        location /box {
            proxy_pass http://box_prod/box;
            proxy_redirect off;
            proxy_set_header        Host            $host;
            proxy_set_header        X-Real-IP       $remote_addr;
            proxy_set_header        X-Forwarded-For $proxy_add_x_forwarded_for;
            proxy_set_header        X-NginX-Proxy   true;
            proxy_http_version 1.1;
            proxy_set_header Upgrade $http_upgrade;
            proxy_set_header Connection $connection_upgrade;
          }

         location /manager {
            proxy_pass http://manager_prod/manager;
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


server {
        listen 80 ;
        server_name store.ntipa.com;

        location / {
            proxy_pass http://store_cloud_prod;
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


server {
        listen 80 ;
	server_name cloud.ntipa.com;

        location / {
            proxy_pass http://box_prod/box;
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
            proxy_pass http://camunda_cloud_prod/camunda;
            proxy_redirect off;
            proxy_set_header        Host            $host;
            proxy_set_header        X-Real-IP       $remote_addr;
            proxy_set_header        X-Forwarded-For $proxy_add_x_forwarded_for;
            proxy_set_header        X-NginX-Proxy   true;
            proxy_http_version 1.1;
            proxy_set_header Upgrade $http_upgrade;
            proxy_set_header Connection $connection_upgrade;
          }


        location /box {
            proxy_pass http://box_prod/box;
            proxy_redirect off;
            proxy_set_header        Host            $host;
            proxy_set_header        X-Real-IP       $remote_addr;
            proxy_set_header        X-Forwarded-For $proxy_add_x_forwarded_for;
            proxy_set_header        X-NginX-Proxy   true;
            proxy_http_version 1.1;
            proxy_set_header Upgrade $http_upgrade;
            proxy_set_header Connection $connection_upgrade;
          }

         location /manager {
            proxy_pass http://manager_prod/manager;
            proxy_redirect off;
            proxy_set_header        Host            $host;
            proxy_set_header        X-Real-IP       $remote_addr;
            proxy_set_header        X-Forwarded-For $proxy_add_x_forwarded_for;
            proxy_set_header        X-NginX-Proxy   true;
            proxy_http_version 1.1;
            proxy_set_header Upgrade $http_upgrade;
            proxy_set_header Connection $connection_upgrade;
          }

         location /protocollo {
            proxy_pass http://protocollo_prod/protocollo;
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
                                                                                                                                              
