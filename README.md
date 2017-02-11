# Liquibase 3.5.3

[![License][license]][license-url]

[license-url]: http://choosealicense.com/licenses/isc/
[license]: https://img.shields.io/npm/l/simon-promise.svg?style=flat-square

## Default Configuration

Runs liquibase 3.5.3 with mysql connector

## Usage

### linking to a mysql container

If you are linking to a mysql container, `entrypoint.sh` will pick up on the
correct configuration via environment variables provided by the mysql container.
The only additional things needed are

* to mount the migrations
* to specify the database against which the migrations will be run

```
docker run -it \
  --link db:mysql \
  --rm \
  -v /local/path/migrations:/changelogs \
  -e TARGET_DATABASE=foo \
  snocorp/liquibase-mysql:3.5.3
```


### Specifying configuration via environment variables

`entrypoint.sh` allows setting of the following to configure the liquibase run:

* `MYSQL_HOST`
* `MYSQL_PORT`
* `MYSQL_USER`
* `MYSQL_PASSWORD`
* `TARGET_DATABASE`
* `CHANGELOG_FILE` (default: `migrations.xml`)
