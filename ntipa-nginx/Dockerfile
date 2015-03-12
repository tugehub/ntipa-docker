FROM tornabene/docker-ntipa-base

MAINTAINER Tindaro Tornabene <tindaro.tornabene@gmail.com>


RUN apt-get install -y --force-yes nginx curl vim


RUN rm -f /etc/nginx/sites-available/default
RUN rm -f /etc/nginx/sites-enabled/default

ADD default /etc/nginx/sites-available/default
RUN ln -s /etc/nginx/sites-available/default  /etc/nginx/sites-enabled/default 


ADD boot.sh /boot.sh
RUN chmod +x /boot.sh

CMD /boot.sh




