#!/bin/sh

DEFAULT_PORT=8080
if [ -z "$PORT" ]; then
	PORT=$DEFAULT_PORT
fi
# change the default 8080 HTTP port to align with the container $PORT
sed s/8080/$PORT/ apache-tomcat/conf/server.xml > apache-tomcat/conf/server_MAR.xml
mv apache-tomcat/conf/server_MAR.xml apache-tomcat/conf/server.xml

export JAVA_OPTS='-Xmx160m'
cd apache-tomcat/bin
./catalina.sh run