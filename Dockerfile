FROM resin/rpi-raspbian
MAINTAINER Gomasy <nyan@gomasy.jp>

# Upgrade and install required packages
RUN sed -ie "s/archive.raspbian.org/ftp.jaist.ac.jp\/pub\/Linux\/raspbian-archive/g" /etc/apt/sources.list
RUN apt-get update && apt-get upgrade -y && apt-get install -y python-twisted python-mysqldb git && apt-get clean

# Install kippo
RUN useradd -d /opt/kippo -s /usr/sbin/nologin kippo
RUN git clone https://github.com/desaster/kippo.git /opt/kippo
RUN cd /opt/kippo && cp kippo.cfg.dist kippo.cfg
RUN chown -R kippo. /opt/kippo

USER kippo
WORKDIR /opt/kippo
CMD ["twistd", "--nodaemon", "-y", "kippo.tac", "-l", "log/kippo.log", "--pidfile=kippo.pid"]
