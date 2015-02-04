FROM centos:6

RUN yum -y update && yum clean all

RUN \
  yum -y install unzip java-1.7.0-openjdk && \
  curl -sf -o liquibase-2.0.5-bin.zip -L http://downloads.sourceforge.net/project/liquibase/Liquibase%20Core/liquibase-2.0.5-bin.zip && \
  mkdir liquibase-2.0.5 && \
  unzip liquibase-2.0.5-bin.zip -d liquibase-2.0.5 && \
  rm -f liquibase-2.0.5-bin.zip

ENTRYPOINT["java", "-jar", "liquibase-2.0.5/liquibase.jar"]