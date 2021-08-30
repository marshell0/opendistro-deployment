 docker run -d \
  --restart=unless-stopped \
  --name=logstash-exporter \
  --hostname=logstash-exporter \
  --network host \
  nexus.ubssdic.com:8445/alxrem/prometheus-logstash-exporter:latest \
  -logstash.host localhost \
  -logstash.port 9610
