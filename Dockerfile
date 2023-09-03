FROM ubuntu
RUN apt update && apt install openjdk-11-jre-dcevm -y && apt install zip -y && apt install wget -y
RUN wget https://dlcdn.apache.org/tomcat/tomcat-8/v8.5.93/bin/apache-tomcat-8.5.93-windows-x64.zip
RUN unzip apache-tomcat-8.5.93-windows-x64.zip
RUN mv apache-tomcat-8.5.93 /mnt/tomcat
RUN chmod 744 /mnt/tomcat/bin/*
EXPOSE 8080
CMD "/mnt/tomcat/bin/catalina.sh" "run"
