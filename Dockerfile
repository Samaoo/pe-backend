FROM maven:3-openjdk-18 AS BUILD
COPY pom.xml /tmp/
COPY src /tmp/src/
WORKDIR /tmp/
RUN mvn package

ENV MYSQL_HOST: 172.17.0.2
ENV MYSQL_USER: user
ENV MYSQL_PASSWORD: *uz^Lfuaj&4M5@2V
ENV MYSQL_DATABASE: db
ENV MYSQL_PORT: 3306

FROM openjdk:18-slim
COPY --from=BUILD /tmp/target/*.jar /catalog.jar
EXPOSE 8080
CMD java -jar /catalog.jar
