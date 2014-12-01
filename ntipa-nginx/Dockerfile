FROM tornabene/docker-ntipa-base

MAINTAINER Tindaro Tornabene <tindaro.tornabene@gmail.com>


RUN apt-get install -y --force-yes nginx curl

RUN curl -L https://github.com/kelseyhightower/confd/releases/download/v0.5.0/confd_0.5.0_linux_amd64 -linux-amd64 -o confd
RUN chmod +x confd
RUN mv confd /usr/local/bin/confd

RUN mkdir -p /etc/confd/{conf.d,templates}

ADD ./nginx.conf.tmpl /etc/confd/templates/nginx.conf.tmpl
ADD ./nginx.toml /etc/confd/conf.d/nginx.toml

RUN rm -f /etc/nginx/sites-enabled/default

# Add boot script
ADD ./boot.sh /opt/boot.sh
RUN chmod +x /opt/boot.sh

CMD /opt/boot.sh




