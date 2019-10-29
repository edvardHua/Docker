cd dl_train
docker build -t dl_train .
cd -
wget https://archive.apache.org/dist/hadoop/core/hadoop-2.7.4/hadoop-2.7.4.tar.gz -P dl_train_hdfs/
cd dl_train_hdfs
docker build -t dl_train_hdfs .
