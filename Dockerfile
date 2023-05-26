FROM maven:3-amazoncorretto-8 AS builder
ADD . /game-of-life
RUN cd /game-of-life && mvn package

FROM tomcat:9-jdk8
LABEL author="Sujata" organization="Testing" project="Game Of Life"
COPY --from=builder /game-of-life/gameoflife-web/target/gameoflife.war /usr/local/tomcat/webapps/gameoflife.war
EXPOSE 8080  