FROM ubuntu
RUN apt update && apt install openjdk-11-jre-dcevm -y && apt install zip -y && apt install wget -y
RUN wget https://dlcdn.apache.org/tomcat/tomcat-8/v8.5.91/bin/apache-tomcat-8.5.91.zip
RUN unzip apache-tomcat-8.5.91.zip
RUN mv apache-tomcat-8.5.91 /mnt/tomcat
COPY context.xml /mnt/tomcat/conf/
COPY mysql-connector.jar /mnt/tomcat/lib/
COPY student.war /mnt/tomcat/webapps/
RUN chmod 744 /mnt/tomcat/bin/*
EXPOSE 8080
EXPOSE 3306
CMD "/mnt/tomcat/bin/catalina.sh" "run"
