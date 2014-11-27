# Ntipa RabbitMQ
FROM tornabene/docker-ntipa-base

MAINTAINER Tindaro Tornaebne "tindaro.tornabene@gmail.com"

ENV DEBIAN_FRONTEND noninteractive

ADD rabbitmq-signing-key-public.asc /tmp/rabbitmq-signing-key-public.asc
RUN apt-key add /tmp/rabbitmq-signing-key-public.asc

RUN echo "deb http://www.rabbitmq.com/debian/ testing main" > /etc/apt/sources.list.d/rabbitmq.list
RUN apt-get update 

ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile

RUN apt-get -qq -y install rabbitmq-server
RUN /usr/sbin/rabbitmq-plugins enable rabbitmq_management
RUN echo "[{rabbit, [{loopback_users, []}]}]." > /etc/rabbitmq/rabbitmq.config
ADD set_rabbitmq_password.sh /set_rabbitmq_password.sh

ADD rabbitmq.sh /rabbitmq.sh
ADD run.sh /run.sh
ADD rabbitmq.conf  /etc/supervisor/conf.d/rabbitmq.conf
 
RUN chmod 755 /*.sh
RUN  /run.sh

WORKDIR /var/log
RUN service  rabbitmq-server stop
EXPOSE 5672 15672 4369 22

CMD /usr/bin/supervisord