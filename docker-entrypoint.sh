#!/bin/bash

liquibase --driver=com.mysql.jdbc.Driver \
     --changeLogFile=/changelogs/migrations.xml \
     --url=jdbc:mysql://${MYSQL_PORT_3306_TCP_ADDR}:$MYSQL_PORT_3306_TCP_PORT/asm \
     --username=root \
     --password= \
     update
