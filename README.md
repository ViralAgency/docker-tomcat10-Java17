# Tomcat 10.1.10 - OpenJDK 17 Docker

This repository was created with the for solve the problem of deploying .war packages on a docker environment. Yes, there are many versions available on Docker, ready to be used, but as often happens in Java, sometimes you need to work on specific and custom versions.

This repository offers a quick solution to [this](https://stackoverflow.com/questions/76793338/spring-boot-war-deployment-failed-on-docker-tomcat-image-error-404) problem.

---

## Installation

1) On Dockerfile, insert the java version of your environment:
   
    Example:

   `RUN apk add openjdk17-jre curl bash`

Some versions available [here](https://pkgs.org/download/java-jdk).

2) On /conf/tomcat.service, replace with your java version path:

    Example:

    `Environment="JAVA_HOME=/usr/lib/jvm/YOUR-JAVA-PATH"`

3) On docker-compose.yml file set your .war source and destination paths: 

    Example:

   `- ./LOCAL-FILE.war:/opt/tomcat/webapps/CONTAINER-FILE.war`

4) Start the environment and check logs:

   `docker compose up`
    


 