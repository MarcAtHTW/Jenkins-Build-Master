FROM jenkins/jenkins:lts

### Install latest Maven ###
USER root
RUN apt-get update && apt-get install -y \
maven

USER jenkins
### ###
