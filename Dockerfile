FROM openjdk
EXPOSE 8080
ADD target/raviLogin.jar raviLogin.jar
ENTRYPOINT ["java","/raviLogin.jar"]