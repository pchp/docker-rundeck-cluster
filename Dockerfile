# Dockerfile for rundeck

FROM debian:stable

MAINTAINER Pascal Chenevas-Paule "https://github.com/pcp"

RUN apt-get update
RUN apt-get install -y bash ca-certificates openjdk-11-jre-headless mariadb-client
RUN apt-get install -y openssh-client pwgen curl git vim uuid-runtime

ADD http://dl.bintray.com/rundeck/rundeck-deb/:rundeck_3.3.5.20201019-1_all.deb /tmp/rundeck.deb
COPY . /app
WORKDIR /app
RUN useradd -d /var/lib/rundeck -s /bin/false rundeck
RUN chmod u+x ./run.sh

EXPOSE 4443

CMD ./run.sh
