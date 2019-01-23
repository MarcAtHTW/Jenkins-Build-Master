FROM jenkins/jenkins:lts

### Install Maven 3.0.5 - START ###
RUN whoami
USER root
RUN wget --no-verbose -O /tmp/apache-maven-3.0.5.tar.gz \
http://archive.apache.org/dist/maven/maven-3/3.0.5/binaries/apache-maven-3.0.5-bin.tar.gz
# stop building if md5sum does not match
RUN echo "94c51f0dd139b4b8549204d0605a5859 /tmp/apache-maven-3.0.5.tar.gz" | \
md5sum -c
# install in /opt/maven
RUN mkdir -p /opt/maven
RUN tar xzf /tmp/apache-maven-3.0.5.tar.gz --strip-components=1 \
-C /opt/maven
RUN ln -s /opt/maven/bin/mvn /usr/local/bin
RUN rm -f /tmp/apache-maven-3.0.5.tar.gz
ENV MAVEN_OPTS -XX:MaxPermSize=450m -Xms600m -Xmx2g
USER jenkins
RUN whoami

### ###
