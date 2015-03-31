# Face recognizer
FROM ubuntu:trusty
MAINTAINER Daniele Giglio <giglio.d@gmail.com>

RUN apt-get update && apt-get install -y rsyslog curl
RUN apt-get update && apt-get install -y software-properties-common
RUN add-apt-repository -y ppa:kurento/kurento
RUN apt-get update
RUN apt-get install -y kurento-media-server 
# RUN apt-get install -y openjdk-7-jdk maven tomcat7
# COPY kurento.conf.json /etc/kurento/
# COPY /etc/timezone /etc/
# RUN curl -sL https://deb.nodesource.com/setup | sudo bash -
# RUN apt-get install -y nodejs git
# RUN npm install -g bower
# RUN npm install -g http-server
# RUN git clone https://github.com/Kurento/kurento-tutorial-js.git /root/kurento-tutorial-js/
# RUN git clone https://github.com/Kurento/kurento-tutorial-java.git /root/kurento-tutorial-java/
# RUN /usr/bin/http-server
# RUN service tomcat7 start
# RUN service kurento-media-server start

EXPOSE 8888

CMD ["/usr/bin/kurento-media-server"]

