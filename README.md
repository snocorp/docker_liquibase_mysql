# Liquibase 2.0.5

## Default Configuration

Runs liquibase 2.0.5 with mysql connector

## Usage

Link this container to your mysql container, start it with your changelogs volume shared.

```
sudo docker run -it --link db:mysql --rm -v /local/path/migrations:/changelogs freshbooks/liquibase-mysql:2.0.5
```
