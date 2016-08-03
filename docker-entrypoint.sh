#!/bin/bash -xe

if [ "$1" = 'prompt' ]; then
  exec /bin/sh
fi

# Use environment variables to determine how to invoke liquibase.  If the
# container is linked to a mysql container, prefer that container's environment
# variables.
default_docker_bridge=172.17.42.1
default_mysql_port=3306
CLIENT_HOST="${MYSQL_PORT_3306_TCP_ADDR:-${MYSQL_HOST:-$default_docker_bridge}}"
CLIENT_PORT="${MYSQL_PORT_3306_TCP_PORT:-${MYSQL_PORT:-$default_mysql_port}}"
CLIENT_USER="${MYSQL_USER:-root}"
CLIENT_PASS="${MYSQL_ENV_MYSQL_ROOT_PASSWORD:-${MYSQL_PASSWORD:-${MYSQL_ROOT_PASSWORD}}}"
if [ ! -z "${CLIENT_PASS}" ]; then
    CLIENT_PASS="--password=${CLIENT_PASS}"
fi

if [ -z "${TARGET_DATABASE}" ]; then
    >&2 echo "TARGET_DATABASE must be provided"
    exit 1
fi

default_changelog_file=migrations.xml
exec liquibase --driver=com.mysql.jdbc.Driver \
     --changeLogFile=/changelogs/${CHANGELOG_FILE:-$default_changelog_file} \
     --url="jdbc:mysql://$CLIENT_HOST:$CLIENT_PORT/$TARGET_DATABASE" \
     --username="${CLIENT_USER}" \
     "$CLIENT_PASS" \
     $1
