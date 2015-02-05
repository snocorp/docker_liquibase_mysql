FROM centos:6

RUN yum -y update && yum clean all

RUN \
  yum -y install unzip java-1.7.0-openjdk

RUN \
  curl -sf -o liquibase-2.0.5-bin.zip -L http://downloads.sourceforge.net/project/liquibase/Liquibase%20Core/liquibase-2.0.5-bin.zip && \
  mkdir /opt/liquibase && \
  unzip liquibase-2.0.5-bin.zip -d /opt/liquibase && \
  rm -f liquibase-2.0.5-bin.zip && \
  chmod +x /opt/liquibase/liquibase && \
  ln -s /opt/liquibase/liquibase /usr/local/bin/

RUN \
  curl -sfL -o mysql-connector-java-5.1.34.zip http://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-java-5.1.34.zip && \
  mkdir /opt/jdbc_drivers/ && \
  unzip mysql-connector-java-5.1.34.zip -d /opt/jdbc_drivers/

ENTRYPOINT["liquibase"]
