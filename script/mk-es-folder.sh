groupadd -g 1000 elasticsearch
useradd -g 1000 -u 1000 elasticsearch
mkdir -p /esdata/master-node/data
mkdir -p /esdata/coordinating-node/data
mkdir -p /esdata/ingest-node/data
mkdir -p /esdata/logstash/data
mkdir -p /esdata/logstash-service/data
mkdir -p /esdata/data-node-x1/data
mkdir -p /esdata/data-node-x2/data
mkdir -p /esdata/data-node-x3/data
mkdir -p /esdata/data-node-x4/data
mkdir -p /esdata/data-node-x5/data
chown -R 1000:1000 /esdata/
