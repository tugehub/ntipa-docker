map $http_upgrade $connection_upgrade {
    default upgrade;
    '' close;
}

upstream sip_prod {
        server 192.168.111.8:8060;
}

upstream kurento_sip{
        server 10.10.130.69:8080;
}

upstream jssip_prod {
        server 127.0.0.1:81;
}


server {
        listen 80;
        server_name sip.ntipa.com;


         location / {
            proxy_pass http://kurento_sip/;
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
        listen 443;
        ssl on;
	server_name sip.ntipa.com;
	ssl_certificate /etc/nginx/cacert.cloud.ntipa.com.pem;
	ssl_certificate_key /etc/nginx/cloud.ntipa.com.pem;
	proxy_set_header X-Forwarded-For $remote_addr;


	location /ws {
            proxy_pass http://sip_prod;
            proxy_redirect off;
            proxy_set_header        Host            $host;
            proxy_set_header        X-Real-IP       $remote_addr;
            proxy_set_header        X-Forwarded-For $proxy_add_x_forwarded_for;
            proxy_set_header        X-NginX-Proxy   true;
            proxy_http_version 1.1;
            proxy_set_header Upgrade $http_upgrade;
            proxy_set_header Connection $connection_upgrade;
          }

	 location / {
            proxy_pass http://kurento_sip/;
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


