#!/bin/bash -x

if [ $1 = 'prompt' ]; then
  exec /bin/sh
fi

liquibase --driver=com.mysql.jdbc.Driver \
     --changeLogFile=/changelogs/migrations.xml \
     $@ \
     update
