FROM dvoros/hive:2.3.3
MAINTAINER dvoros

USER root

ENV SQOOP_HOME /usr/local/sqoop

RUN curl -L -k1 -s https://github.com/dvoros/sqoop/releases/download/release-3.0.0-dvoros1/sqoop-1.5.0-SNAPSHOT.bin__hadoop-3.0.0.tar.gz | tar -xz -C /usr/local
RUN ln -s /usr/local/sqoop-1.5.0-SNAPSHOT.bin__hadoop-3.0.0 $SQOOP_HOME

ENV PATH $PATH:$SQOOP_HOME/bin

# Sqoop won't pick up Hive stuff if there's no HCAT_HOME, need to manually add these
ENV SQOOP_USER_CLASSPATH $HIVE_HOME/lib/*:$HIVE_HOME/conf

COPY entrypoint.sh /etc/docker-startup/entrypoint.sh
RUN chown -R root:root /etc/docker-startup
RUN chmod -R 700 /etc/docker-startup
