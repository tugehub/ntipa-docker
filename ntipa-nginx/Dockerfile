FROM ubuntu:trusty
MAINTAINER Tindaro Tornabene <tindaro.tornabene@gmail.com>

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get -y update

RUN apt-get install -y --force-yes nginx curl vim


RUN rm -f /etc/nginx/sites-available/default
RUN rm -f /etc/nginx/sites-enabled/default

ADD default /etc/nginx/sites-available/default
RUN ln -s /etc/nginx/sites-available/default  /etc/nginx/sites-enabled/default 
RUN  cat /etc/nginx/sites-enabled/default

ADD boot.sh /boot.sh
RUN chmod +x /boot.sh

RUN sed -i 's/\#\ Basic\ Settings/client_max_body_size 250M;/' /etc/nginx/nginx.conf
CMD /boot.sh




