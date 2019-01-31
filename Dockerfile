FROM msahib/jenkins-build-master:v1

USER root

RUN apt-get update && apt-get install -y \
maven \
apt-transport-https \
vim \
mercurial

#RUN apt-get remove && apt-get purge mercurial -y
USER jenkins
