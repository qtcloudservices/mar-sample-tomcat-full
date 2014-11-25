# Managed Application Runtime - Apache Tomcat Server Full Deployment Example

This is an example of full Apache Tomcat server deployment with a sample "Hello World" application for Qt Cloud Services - Managed Application Runtime ("**MAR**"). More information about [Apache Tomcat](http://tomcat.apache.org/).

## Getting Started

See the Managed Application Runtime getting started documentation at Qt Cloud Services [Developer Documentation ](https://developer.qtcloudservices.com/mar/getting-started)

## Some Notes About the Files in This Example


### Procfile

Procfile instructs the web process type to run the java.sh file which containts the detailed information how to startup the application.

### java.sh

Upon deployment Qt Cloud Services MAR container provides an environmental variable **$PORT** for which the HTTPS requests hitting Qt Cloud Services load balancer SSL port are internally forwarded into. 

When running this sample locally without the **$PORT** environmental variable set Tomcat will listen the HTTP port 8080 for incoming connections. In case the file "apache-tomcat/conf/server.xml" has not been mofified, this script changes the default 8080 listener port to match the MAR container defined **$PORT** when executed by a web process in MAR container.

### system.properties

This file contains only the dependency information about Java version to be used (Java 7).

### apache-tomcat

"apache-tomcat" directory contains Apache Tomcat server version 7.0.55.0 which was downloaded and uncompressed into the directory in question. Regarding the downloaded version, all the embedded WAR modules from "apache-tomcat/webapps" directory has been removed and the sample hello-world-webapp.war application has been put in place.

## Running and Testing Application Locally

You can start this application from the application root directory with the following commands depending your operating system:

### *nix
```
./java.sh
```

You may replace the **$PORT** environmental variable with the chosen port number that your local shell process is privileged to run. If the **$PORT** variable is omitted, the HTTP server defaults the port 8080.

### Windows
```
cd apache-tomcat/bin
startup.bat
```

Once the server has been started, you may test the sample application with your web browser at address http://127.0.0.1:8080/hello-world-webapp which should respond with "Hello World!".

## Deploying to Cloud

Please see the Qt Cloud Services [Developer Documentation ](https://developer.qtcloudservices.com/mar/getting-started)

**NOTE**: Without tweaking any command-line Java arguments regarding the heap memory usage deploy the sample app only to the instance which fulfills the following Runtime Size: **ar-1-small (2CU, 512MB)** 

Once having the application deployed and running in the cloud, you may test the sample application with your web browser at address https://<your-app-ID>.qtcloudapp.com/hello-world-webapp which should respond with "Hello World!".