# spark docker image
based on the hadoop-on-docker image in the [hadoop-docker](https://github.com/timmyraynor/hadoop-on-docker) image. This is a Spark on YARN example.
Components:
  - Spark
  - YARN
  - R
  - Hadoop

# how to build & run
use the following command to build your customized image:

```shell
  docker build -t timmyraynor/spark:latest .
```

or you could pull from the docker hub:

```shell
  docker pull timmyraynor/spark
```

the image start with the bootstrap.sh script, which did the following steps:
  - init hadoop with hdfs
  - init hadoop with yarn
  - specify the spark.yarn.jars to the hdfs path libs to avoid packaging at spark-shell / spark-submit time
 
