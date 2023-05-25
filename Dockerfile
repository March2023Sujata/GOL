FROM alpine/git AS VCS
RUN cd / && git clone https://github.com/March2023Sujata/GOL.git

FROM maven:3-amazoncorretto-8 AS builder
COPY --from=VCS /GOL /game-of-life
RUN cd /game-of-life && mvn package

FROM tomcat:9-jdk8
LABEL author="Sujata" organization="Testing" project="Game Of Life"
COPY --from=builder /game-of-life/gameoflife-web/target/gameoflife.war /usr/local/tomcat/webapps/gameoflife.war
EXPOSE 8080  