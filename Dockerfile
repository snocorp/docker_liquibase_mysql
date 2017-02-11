FROM centos:6

RUN yum -y update && yum clean all

RUN \
  yum -y install unzip java-1.7.0-openjdk

RUN \
  curl -sf -o liquibase-3.5.3-bin.zip -L https://github.com/liquibase/liquibase/releases/download/liquibase-parent-3.5.3/liquibase-3.5.3-bin.zip && \
  mkdir /opt/liquibase && \
  unzip liquibase-3.5.3-bin.zip -d /opt/liquibase && \
  rm -f liquibase-3.5.3-bin.zip && \
  chmod +x /opt/liquibase/liquibase && \
  ln -s /opt/liquibase/liquibase /usr/local/bin/

RUN \
  curl -sfL -o mysql-connector-java-5.1.40.zip http://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-java-5.1.40.zip && \
  mkdir /opt/jdbc_drivers/ && \
  unzip mysql-connector-java-5.1.40.zip -d /opt/jdbc_drivers/ && \
  chmod +x /opt/jdbc_drivers/mysql-connector-java-5.1.40/mysql-connector-java-5.1.40-bin.jar && \
  mkdir -p /opt/liquibase/lib/ && \
  ln -s /opt/jdbc_drivers/mysql-connector-java-5.1.40/mysql-connector-java-5.1.40-bin.jar /opt/liquibase/lib/

VOLUME ["/changelogs"]

WORKDIR /changelogs

ENV LIQUIBASE_HOME /opt/liquibase

COPY docker-entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
