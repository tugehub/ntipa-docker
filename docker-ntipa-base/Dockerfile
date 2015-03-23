# NTIPA-BASE 0.0.1
FROM ubuntu:trusty
MAINTAINER Tindaro Tornabene <tindaro.tornabene@gmail.com>

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update
RUN apt-get -y -q  install  python-software-properties software-properties-common
RUN apt-get install -yqq inetutils-ping net-tools

# install oracle java from PPA
RUN add-apt-repository ppa:webupd8team/java -y
RUN apt-get update
RUN echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections
RUN apt-get -y install oracle-java7-installer && apt-get clean

# Set oracle java as the default java
RUN update-java-alternatives -s java-7-oracle
RUN echo "export JAVA_HOME=/usr/lib/jvm/java-7-oracle" >> ~/.bashrc

ENV POSTGRES_HOST 127.0.0.1
ENV MONGO_HOST 127.0.0.1
ENV SOLR_HOST 127.0.0.1
ENV RABBITMQ_ADDRESSES 127.0.0.1:5672


RUN echo "POSTGRES_HOST $POSTGRES_HOST."
RUN echo "MONGO_HOST $MONGO_HOST."
RUN echo "SOLR_HOST $SOLR_HOST."
RUN echo "RABBITMQ_ADDRESSES $RABBITMQ_ADDRESSES."


WORKDIR /opt
RUN whereis java

EXPOSE 8080
EXPOSE 8333
EXPOSE 8081