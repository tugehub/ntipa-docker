FROM tornabene/docker-ntipa-base

MAINTAINER Tindaro Tornabene <tindaro.tornabene@gmail.com>


RUN apt-get install -y --force-yes nginx curl

RUN curl -L https://github.com/kelseyhightower/confd/releases/download/v0.3.0/confd_0.3.0_linux_amd64.tar.gz | tar xz
RUN mv confd /usr/local/bin/confd

RUN mkdir -p /etc/confd/conf.d
RUN mkdir -p /etc/confd/templates

ADD ./nginx.conf.tmpl /etc/confd/templates/nginx.conf.tmpl
ADD ./nginx.toml /etc/confd/conf.d/nginx.toml

# Remove default site
RUN rm -f /etc/nginx/sites-enabled/default

# Add boot script
ADD ./boot.sh /opt/boot.sh
RUN chmod +x /opt/boot.sh

# Run the boot script
CMD /opt/boot.sh




