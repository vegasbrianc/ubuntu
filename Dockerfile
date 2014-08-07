FROM ubuntu:14.04
MAINTAINER Brian Christner <brian.christner@gmail.com>
EXPOSE 80

RUN apt-get --yes update
RUN apt-get --yes upgrade
RUN apt-get --yes install apt-get install sudo tofrodos bsd-mailx lsb-release mysql-server libmysqlclient15-dev \
    apache2 apache2-mpm-prefork php5 php5-mysql php-pear php5-ldap php5-snmp php5-gd \
    rrdtool librrds-perl libconfig-inifiles-perl libcrypt-des-perl libdigest-hmac-perl \
    libdigest-sha-perl libgd-gd2-perl snmp snmpd libnet-snmp-perl libsnmp-perl
    

ADD http://download.### /tmp/###.tar.gz


RUN mkdir /opt/centreon
RUN tar -zxvf /tmp/###.tar.gz -C /opt/###

WORKDIR /opt/###
RUN /opt/###

#ADD config_template.yaml /opt/uptime/config/config_template.yaml
#RUN rm /opt/uptime/config/default.yaml

#ADD run-uptime.sh /opt/run-uptime.sh
#RUN chmod +x /opt/run-uptime.sh



#ENTRYPOINT ["/opt/run-uptime.sh"]
#CMD ["rootpass"]
