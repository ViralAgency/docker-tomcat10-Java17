FROM alpine:latest

LABEL maintainer="viralsrls@gmail.com"

RUN apk update && apk upgrade

RUN apk add openjdk17-jre curl bash

RUN mkdir /opt/tomcat

WORKDIR /opt/tomcat

RUN curl -O  https://downloads.apache.org/tomcat/tomcat-10/v10.1.10/bin/apache-tomcat-10.1.10.tar.gz

RUN tar xvfz apache*.tar.gz --strip-components 1 --directory /opt/tomcat

ADD /manager/tomcat-users.xml /opt/tomcat/conf/tomcat-users.xml

ADD /manager/context.xml /opt/tomcat/webapps/manager/META-INF/context.xml

ADD /host/context.xml /opt/tomcat/webapps/host-manager/META-INF/context.xml

ADD /conf/tomcat.service /etc/systemd/system/tomcat.service

EXPOSE 8080
