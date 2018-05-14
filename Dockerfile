FROM dvoros/hadoop:2.9.0
MAINTAINER dvoros

USER root

ENV SQOOP_HOME /usr/local/sqoop

RUN curl -L -k1 -s https://github.com/dvoros/sqoop/releases/download/release-3.0.0-dvoros1/sqoop-1.5.0-SNAPSHOT.bin__hadoop-3.0.0.tar.gz | tar -xz -C /usr/local
RUN ln -s /usr/local/sqoop-1.5.0-SNAPSHOT.bin__hadoop-3.0.0 $SQOOP_HOME

ENV PATH $PATH:$HADOOP_HOME/bin:$SQOOP_HOME/bin

COPY bootstrap.sh /etc/bootstrap.sh
RUN chown root.root /etc/bootstrap.sh
RUN chmod 700 /etc/bootstrap.sh

CMD ["/etc/bootstrap.sh"]
