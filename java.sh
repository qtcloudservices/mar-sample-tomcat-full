#!/bin/sh

export JAVA_OPTS='-Xmx256m'
cd apache-tomcat/bin
./catalina.sh run