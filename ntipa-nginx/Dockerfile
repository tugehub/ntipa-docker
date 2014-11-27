FROM tornabene/docker-ntipa-base

MAINTAINER Tindaro Tornabene <tindaro.tornabene@gmail.com>

RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections
RUN apt-get update && apt-get install -y -q wget apt-transport-https

ADD nginx.crt /etc/ssl/nginx/
ADD nginx.key /etc/ssl/nginx/

# Install NGINX Plus
RUN apt-get update 
RUN apt-get install -y nginx-full

RUN ln -sf /dev/stdout /var/log/nginx/access.log
RUN ln -sf /dev/stderr /var/log/nginx/error.log

ADD default  /etc/nginx/sites-enabled/default
EXPOSE 80 443

CMD ["nginx", "-g", "daemon off;"]



