FROM dvoros/hive:HDP-2.6.3.0-hive2
MAINTAINER dvoros

USER root

ENV SQOOP_HOME /usr/local/sqoop

RUN curl -L -k1 -s http://s3.amazonaws.com/public-repo-1.hortonworks.com/HDP/centos6/2.x/updates/2.6.3.0/tars/sqoop/sqoop-1.4.6.2.6.3.0-235.bin__hadoop-2.7.3.2.6.3.0-235.tar.gz | tar -xz -C /usr/local
RUN ln -s /usr/local/sqoop-1.4.6.2.6.3.0-235.bin__hadoop-2.7.3.2.6.3.0-235 $SQOOP_HOME

# Hortonworks Connector for Teradata
RUN curl -L -k1 -s http://s3.amazonaws.com/public-repo-1.hortonworks.com/HDP/centos6/2.x/updates/2.6.3.0/tars/teradata_connector/hdp-connector-for-teradata-1.5.2.2.6.3.0-235-distro.tar.gz | tar -xz -C $SQOOP_HOME/lib

# Byteman
ENV BYTEMAN_HOME /usr/local/byteman
RUN mkdir $BYTEMAN_HOME
RUN curl -L -k1 -s http://downloads.jboss.org/byteman/4.0.4/byteman-download-4.0.4-bin.zip > $BYTEMAN_HOME/byteman.zip
RUN unzip -d $BYTEMAN_HOME $BYTEMAN_HOME/byteman.zip
ENV BYTEMAN_HOME $BYTEMAN_HOME/byteman-download-4.0.4

ENV PATH $PATH:$SQOOP_HOME/bin

# Sqoop won't pick up Hive stuff if there's no HCAT_HOME, need to manually add these
ENV SQOOP_USER_CLASSPATH $HIVE_HOME/lib/*:$HIVE_HOME/conf

COPY entrypoint.sh /etc/docker-startup/entrypoint.sh
RUN chown -R root:root /etc/docker-startup
RUN chmod -R 700 /etc/docker-startup

CMD ["/etc/docker-startup/entrypoint.sh"]
