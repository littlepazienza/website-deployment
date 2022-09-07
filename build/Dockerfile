FROM jenkins/jenkins:lts as jenkins
USER root
RUN apt-get update && apt-get install -y lsb-release
RUN curl -fsSLo /usr/share/keyrings/docker-archive-keyring.asc \
  https://download.docker.com/linux/debian/gpg
RUN echo "deb [arch=$(dpkg --print-architecture) \
  signed-by=/usr/share/keyrings/docker-archive-keyring.asc] \
  https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" > /etc/apt/sources.list.d/docker.list
RUN apt-get update && apt-get install -y docker-ce-cli
RUN apt-get install zip
USER jenkins
RUN jenkins-plugin-cli --plugins "blueocean:1.25.3 docker-workflow:1.28"

FROM rust as blog-server
USER root
RUN apt-get update
RUN apt-get install unzip
RUN curl -sSLO https://jenkins.paz.ienza.tech/job/blog-server/job/main/lastSuccessfulBuild/artifact/blog-server.tar.gz
RUN tar -xzvf blog-server.tar.gz -C .
RUN rustup default nightly && cargo build

FROM rust as url-shortener
USER root
RUN apt-get update
RUN apt-get install unzip
RUN curl -sSLO https://jenkins.paz.ienza.tech/job/url-shortener/job/main/lastSuccessfulBuild/artifact/url-shortener.tar.gz
RUN tar -xzvf url-shortener.tar.gz -C .
RUN rustup default nightly && cargo build
