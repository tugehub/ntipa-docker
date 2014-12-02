FROM tornabene/docker-ntipa-base

MAINTAINER Tindaro Tornabene <tindaro.tornabene@gmail.com>


RUN apt-get install -y --force-yes nginx curl vim


WORKDIR /usr/local/bin/
RUN curl -L https://github.com/kelseyhightower/confd/releases/download/v0.6.3/confd-0.6.3-linux-amd64 -o confd
RUN chmod +x confd

RUN mkdir -p /etc/confd/{conf.d,templates}
ADD nginx.conf.tmpl /etc/confd/templates/nginx.conf.tmpl
ADD nginx.toml /etc/confd/conf.d/nginx.toml

RUN rm -f /etc/nginx/sites-enabled/default

ADD boot.sh /boot.sh
RUN chmod +x /boot.sh

CMD /boot.sh




