docker run -d \
    --restart=unless-stopped \
    --name logstash \
    --mount type=bind,source=/esdata/logstash/data,target=/usr/share/logstash/data \
    --mount type=bind,source=/home/elasticsearch/ssl-key/root-ca.pem,target=/usr/share/logstash/config/root-ca.pem,readonly \
    --mount type=bind,source=/home/elasticsearch/ssl-key/logstash.pem,target=/usr/share/logstash/config/logstash.pem,readonly \
    --mount type=bind,source=/home/elasticsearch/ssl-key/logstash-key.pem,target=/usr/share/logstash/config/logstash-key.pem,readonly \
    --mount type=bind,source=/home/elasticsearch/logstash/pipeline/,target=/usr/share/logstash/pipeline/ \
    --mount type=bind,source=/home/elasticsearch/logstash/config/pipelines.yml,target=/usr/share/logstash/config/pipelines.yml \
    --mount type=bind,source=/home/elasticsearch/logstash/config/logstash.yml,target=/usr/share/logstash/config/logstash.yml \
    --network host \
    -e 'LS_HEAP_SIZE=8G' \
    nexus.my-domain.com:9443/logstash/logstash-oss:7.12.1 

