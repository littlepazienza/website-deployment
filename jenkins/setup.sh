#! /bin/bash

JENKINS_BIN=/usr/local/jenkins/bin
export PATH="$JENKINS_BIN:$PATH"

# If docker isnt where we want it then delete it
if test -f /usr/bin/docker; then
  mv /usr/bin/docker $JENKINS_BIN
fi

if [ -x "$(command -v docker)" ]; then
    echo "Docker is installed"
  # command
else
  echo "Installing docker"
  # Install docker
  curl -fsSL https://get.docker.com -o /usr/local/bin/get-docker.sh
  chmod +x /usr/local/bin/get-docker.sh
  /usr/local/bin/get-docker.sh

  mv /usr/bin/docker $JENKINS_BIN
  docker -v
fi

# run jenkins
jenkins.sh
