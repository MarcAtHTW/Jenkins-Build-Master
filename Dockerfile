FROM msahib/jenkins-build-master:v1

### Install latest Maven ###
USER root
RUN apt-get update && apt-get install -y \
maven \
apt-transport-https \
vim

RUN apt-get remove && apt-get purge mercurial -y

USER jenkins

### Copy settinfs.xml in jenkins-dir to avoid surefire-plugin error when running maven-tests ###

COPY --chown=jenkins:jenkins  maven-settings/settings.xml /var/jenkins_home/.m2/settings.xml
