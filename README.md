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
 
After pull, run the following command to get into bash mode:

```shell
  docker run -it -p 8088:8088 -p 8042:8042 -p 4040:4040 -p 50070:50070 -h sandbox timmyraynor/spark bash
```
or just run it as a backend service:

```shell
  docker run -d -h sandbox timmyraynor/spark -d
```

please note that the `-h sandbox` option is required for the `yarn-site.xml` file which refer to host as *sandbox*

# docker compose
docker compose is now supported in this image, git clone and then run

```shell
  docker-compose up
```

Will give you the right build with minio as the object exchange server
