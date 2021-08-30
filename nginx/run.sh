docker run -d \
    --restart=unless-stopped \
    --name nginx \
    --mount type=bind,source=/home/elasticsearch/nginx/nginx.conf,target=/etc/nginx/nginx.conf \
    --network host \
    -e 'NGINX_PORT=8043' \
    nexus.ubssdic.com:8445/nginx:1.21
