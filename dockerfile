FROM ubuntu:14.04
MAINTAINER Brian Christner <brian.christner@gmail.com>
EXPOSE 8082

RUN apt-get --yes update
RUN apt-get --yes upgrade
RUN apt-get -qq install apt-get install sudo tofrodos bsd-mailx lsb-release mysql-server libmysqlclient15-dev \
    apache2 apache2-mpm-prefork php5 php5-mysql php-pear php5-ldap php5-snmp php5-gd \
    rrdtool librrds-perl libconfig-inifiles-perl libcrypt-des-perl libdigest-hmac-perl \
    libdigest-sha-perl libgd-gd2-perl snmp snmpd libnet-snmp-perl libsnmp-perl
    
RUN sudo sed -i '$a deb http://archive.ubuntu.com/ubuntu precise main multiverse' /etc/apt/sources.list
RUN apt-get --yes update
RUN apt-get install snmp-mibs-downloader

ADD http://download.centreon.com/index.php?id=4314 /tmp/centreon.tar.gz


RUN mkdir /opt/centreon
RUN tar -zxvf /tmp/centreon.tar.gz -C /opt/centreon --strip-components=1

WORKDIR /opt/centreon
RUN /opt/centreon/install.sh -i

#ADD config_template.yaml /opt/uptime/config/config_template.yaml
#RUN rm /opt/uptime/config/default.yaml

#ADD run-uptime.sh /opt/run-uptime.sh
#RUN chmod +x /opt/run-uptime.sh



#ENTRYPOINT ["/opt/run-uptime.sh"]
#CMD ["rootpass"]
