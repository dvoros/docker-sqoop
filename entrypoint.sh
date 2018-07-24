#!/bin/bash

# This version of hive was not built to be built on, workaround that
sed -i '$d' /etc/bootstrap.sh

# Start Hadoop services
/etc/bootstrap.sh

# Copy JDBC drivers (if mounted) to classpath
cp /jdbc/* $SQOOP_HOME/lib

# Leave user with a shell
/bin/bash
