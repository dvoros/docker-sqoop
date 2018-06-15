FROM dvoros/hive:HDP-3.0.0.0-1411
MAINTAINER dvoros

USER root

ENV SQOOP_HOME /usr/local/sqoop

RUN curl -L -k1 -s http://s3.amazonaws.com/dev.hortonworks.com/HDP/centos7/3.x/BUILDS/3.0.0.0-1411/tars/sqoop/sqoop-1.4.7.3.0.0.0-1411.bin__hadoop-3.0.0.3.0.0.0-1411.tar.gz | tar -xz -C /usr/local
RUN ln -s /usr/local/sqoop-1.4.7.3.0.0.0-1411.bin__hadoop-3.0.0.3.0.0.0-1411 $SQOOP_HOME

ENV PATH $PATH:$SQOOP_HOME/bin

# Sqoop won't pick up Hive stuff if there's no HCAT_HOME, need to manually add these
ENV SQOOP_USER_CLASSPATH $HIVE_HOME/lib/*:$HIVE_HOME/conf

COPY entrypoint.sh /etc/docker-startup/entrypoint.sh
RUN chown -R root:root /etc/docker-startup
RUN chmod -R 700 /etc/docker-startup
