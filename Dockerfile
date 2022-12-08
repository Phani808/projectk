FROM tomcat 
WORKDIR webapps 
COPY target/raviLogin-2.0-SNAPSHOT.war .
RUN rm -rf ROOT && mv raviLogin-2.0-SNAPSHOT.war ROOT.war
#entrypoint
ENTRYPOINT ["sh", "/usr/local/tomcat/bin/startup.sh"]