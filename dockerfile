FROM ubuntu:14.04
MAINTAINER Brian Christner <brian.christner@gmail.com>
EXPOSE 8082

RUN apt-get --yes update
RUN apt-get --yes upgrade
RUN apt-get -qq install nodejs npm

ADD https://github.com/fzaninotto/uptime/tarball/master /tmp/uptime.tar.gz


RUN mkdir /opt/uptime
RUN tar -zxvf /tmp/uptime.tar.gz -C /opt/uptime --strip-components=1

WORKDIR /opt/uptime
RUN npm install

ADD config_template.yaml /opt/uptime/config/config_template.yaml
RUN rm /opt/uptime/config/default.yaml

ADD run-uptime.sh /opt/run-uptime.sh
RUN chmod +x /opt/run-uptime.sh



ENTRYPOINT ["/opt/run-uptime.sh"]
CMD ["rootpass"]
