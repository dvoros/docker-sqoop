# Apache Sqoop Docker image

[![DockerPulls](https://img.shields.io/docker/pulls/dvoros/sqoop.svg)](https://registry.hub.docker.com/u/dvoros/sqoop/)
[![DockerStars](https://img.shields.io/docker/stars/dvoros/sqoop.svg)](https://registry.hub.docker.com/u/dvoros/sqoop/)

_Note: this is the master branch - for a particular Sqoop version always check the related branch_

## Usage

You'll have to provide the JDBC jars in a volume when running:

```
docker run -v /path/to/jdbc-jars:/jdbc -it dvoros/sqoop:latest
```

## MySQL import example

```
MYSQL_HOST=
MYSQL_USER=
MYSQL_PASS=
MYSQL_DB=
MYSQL_TABLE=
sqoop import --connect jdbc:mysql://$MYSQL_HOST/$MYSQL_DB --table $MYSQL_TABLE --username $MYSQL_USER --password $MYSQL_PASS -m 1
```
