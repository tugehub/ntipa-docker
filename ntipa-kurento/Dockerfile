# Face recognizer
FROM ubuntu:trusty
MAINTAINER Daniele Giglio <giglio.d@gmail.com>

RUN apt-get update && apt-get install -y rsyslog curl
RUN apt-get update && apt-get install -y software-properties-common
RUN add-apt-repository -y ppa:kurento/kurento
RUN apt-get update
RUN apt-get install -y kurento-media-server 
COPY kurento.conf.json /etc/kurento/
RUN sed -i "s/\(\"announcedAddress\" : \"\)localhost\(\"\)/\1`curl ipinfo.io/ip`\2/g" /etc/kurento/kurento.conf.json 
EXPOSE 8888

CMD ["/usr/bin/kurento-media-server"]

