# Liquibase 2.0.5

## Default Configuration

Runs liquibase 2.0.5 with mysql connector

## Usage

Link this container to your mysql container, start it with your changelogs volume shared.

```
sudo docker run -it --link db:mysql --rm freshbooks/liquibase:2.0.5 -c 'liquibase --driver=com.mysql.jdbc.Driver \
     --changeLogFile=/changelogs/migrations.xml \
     --classpath="/usr/local/bin/mysql-connector-java-5.1.34-bin.jar" \
     --url="jdbc:mysql://$MYSQL_PORT_3306_TCP_ADDR:$MYSQL_PORT_3306_TCP_PORT/dbname" \
     --username=root \
     --password= \
     update'
```
