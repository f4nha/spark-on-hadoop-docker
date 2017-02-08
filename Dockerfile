FROM timmyraynor/hadoop-docker:latest
MAINTAINER Tim.Qin<qinyujue@gmail.com>

# get scala library
RUN apt-get -y install scala

# get spark
RUN wget -q -O /tmp/spark-2.1.0-bin-hadoop2.7.tgz http://d3kbcqa49mib13.cloudfront.net/spark-2.1.0-bin-hadoop2.7.tgz

# unzip and create link folder
RUN tar -xzf /tmp/spark-2.1.0-bin-hadoop2.7.tgz -C /usr/local
RUN cd /usr/local && ln -s spark-2.1.0-bin-hadoop2.7 spark

ENV SPARK_HOME /usr/local/spark
RUN mkdir $SPARK_HOME/yarn-remote-client
ADD yarn-remote-client $SPARK_HOME/yarn-remote-client

# add spark libraries into hdfs, assuming the hdfs is already formatted
RUN $BOOTSTRAP && $HADOOP_PREFIX/bin/hdfs dfs -put $SPARK_HOME/jars /spark

ENV YARN_CONF_DIR $HADOOP_PREFIX/etc/hadoop
ENV PATH $PATH:$SPARK_HOME/bin:$HADOOP_PREFIX/bin

# update boot script
COPY bootstrap.sh /etc/bootstrap.sh
RUN chown root.root /etc/bootstrap.sh
RUN chmod 777 /etc/bootstrap.sh

# too much for a simple spark, you could do R if you want it
RUN apt-get -y install r-base

ENTRYPOINT ["/etc/bootstrap.sh"]