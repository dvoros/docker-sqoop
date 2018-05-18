#!/bin/bash

# Start Hadoop services
/etc/docker-startup/hive-bootstrap.sh

# Copy JDBC drivers (if mounted) to classpath
cp /jdbc/* $SQOOP_HOME/lib

# Leave user with a shell
/bin/bash
