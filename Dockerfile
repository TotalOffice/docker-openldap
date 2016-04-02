FROM debian:jessie
MAINTAINER avinash.s@yukthi.com

RUN apt-get update
RUN apt-get -y dist-upgrade
RUN echo "slapd   slapd/no_configuration  boolean true" | debconf-set-selections
RUN apt-get -y install slapd ldap-utils slapd-smbk5pwd
RUN apt-get -y install python-ldap
RUN apt-get -y install python-apt
RUN apt-get -y install ldap-utils
RUN apt-get -y install python-smbpasswd
RUN apt-get -y install python-psycopg2
RUN apt-get -y install python-cracklib
RUN apt-get -y install python-flask

RUN mkdir /var/run/slapd
RUN chown openldap:openldap /var/run/slapd

RUN apt-get clean

COPY /run-slapd /
CMD ["/run-slapd"]
