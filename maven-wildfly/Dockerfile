FROM centos:7

RUN yum -y update
RUN yum -y groupinstall "Development Tools"
RUN yum -y install freetype fontconfig
RUN yum clean all

WORKDIR /opt

# Install Java
RUN curl -LO 'http://download.oracle.com/otn-pub/java/jdk/8u51-b16/jdk-8u51-linux-x64.tar.gz' -H 'Cookie: oraclelicense=accept-securebackup-cookie'
RUN tar xzf jdk-8u51-linux-x64.tar.gz
ENV JAVA_HOME /opt/jdk1.8.0_51

#Install Maven
RUN curl -LO 'http://apache.mirrors.spacedump.net/maven/maven-3/3.3.3/binaries/apache-maven-3.3.3-bin.tar.gz'
RUN tar xzf apache-maven-3.3.3-bin.tar.gz
ENV MAVEN_HOME /opt/apache-maven-3.3.3

#Install Wildfly
ENV WILDFLY_VERSION 9.0.0.Final
ENV JBOSS_HOME /opt/wildfly
RUN cd $HOME && curl http://download.jboss.org/wildfly/$WILDFLY_VERSION/wildfly-$WILDFLY_VERSION.tar.gz | tar zx && ln -s $HOME/wildfly-$WILDFLY_VERSION $JBOSS_HOME

ENV PATH $PATH:$JAVA_HOME/bin:$MAVEN_HOME/bin:/opt/build/node
EXPOSE 8080

ADD pom.xml build/

ENTRYPOINT cd build && mvn clean install && cp target/war.war $JBOSS_HOME/standalone/deployments && $JBOSS_HOME/bin/standalone.sh -b 0.0.0.0
