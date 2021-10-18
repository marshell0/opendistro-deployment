
# OpenDistro for Elasticsearch deployment scripts

These Open Distro for Elasticsearch deployment scripts are excerpted from the production repository, were tested running OK. Below is the production hardware/software resources used for this deployment:

* Hardware: 3 * x86 Servers (40*2 Cores, 3.1GHz, 512G memory, 44T hard disk) 
* Software: CentOS 7.6, Docker Swarm CE 20.10.5

7 ES nodes are designed in one physical server, including 1 Master node, 1 coordinating node, 1 ingest node, and 4 data nodes. 


The logic architecture diagram is as below:
![logic architecture diagram](image/logic.png?raw=true)

Logstash running as an independent docker in host mode, because we need to retrieve the client source IP address, and Nginx is introduced for load balance accordingly; you can run it as a global docker service if no source IP is required, then no Nginx is required as docker swarm has its internal load balancer.

Opendistro image used in the docker-compose.yml is a customized image, with some security configuration files packed inside, such as config.yml with LDAP support, keystore with an email username and password added, common certificate files, customized alerting and notification jar files, these jar files you can refer to (https://github.com/marshell0/alerting/releases)

Script files under these folders include:
* etc, server host import configurations file need to be set for OpenDistro
* logstash, logstash configuration, and pipeline files
* Nginx, Nginx configuration file, and startup script
* script, some scripts for Docker swarm environment preparation
* ssl-key, public/private key generation script
* util, services deployment/remove/status check script
* docker, scripts to build custom opendistro image


The deployment architecture diagram is as below:
![deployment architecture diagram](image/deployment.png?raw=true) 

## Security issue notifications

If you discover a potential security issue in this project we ask that you notify us via email


## Licensing

See the [LICENSE](./LICENSE.txt) file for our project's licensing. We will ask you to confirm the licensing of your contribution.


## Copyright

Copyright 2016-2021 ubssdic.com, Inc. or its affiliates. All Rights Reserved.
