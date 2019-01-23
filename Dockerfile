FROM jenkins/jenkins:lts

### Install latest Maven ###
USER root
RUN apt-get update && apt-get install -y \
maven
USER jenkins

### Copy settinfs.xml in jenkins-dir to avoid surefire-plugin error when running maven-tests ###

COPY maven-settings/settings.xml /var/jenkins_home/.m2/settings.xml

