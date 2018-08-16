FROM maven:3.5.4-jdk-8-alpine as compiler
COPY src /usr/src/app/src  
COPY pom.xml /usr/src/app
RUN mvn -B -f /usr/src/app/pom.xml -s /usr/share/maven/ref/settings-docker.xml dependency:resolve clean package

FROM openjdk:8-jre-alpine
VOLUME /tmp
COPY --from=compiler /usr/src/app/target/spring-boot-docker.jar spring-boot-docker.jar

ENTRYPOINT ["java"]
CMD ["-Djava.security.egd=file:/dev/./urandom","-jar","/spring-boot-docker.jar"]

EXPOSE 8080