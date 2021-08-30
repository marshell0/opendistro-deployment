 docker service create \
  --name=elastic-hq \
  --hostname=elastic-hq \
  --restart-condition=on-failure \
  --network esnet \
  --mode global \
  --with-registry-auth \
  --publish published=5603,target=5000,mode=host \
  --mount type=bind,source=/home/elasticsearch/ssl-key/root-ca.pem,target=/etc/root-ca.pem,readonly \
  -e HQ_DEFAULT_URL=https://coordinating:9200 \
  -e HQ_ENABLE_SSL=true \
  -e HQ_DEBUG=true \
  -e HQ_CA_CERTS=/etc/root-ca.pem \
  --constraint 'node.labels.vip-group == true' \
  nexus.ubssdic.com:8445/elastichq/elasticsearch-hq:release-v3.5.12

