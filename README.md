
# OpenDistro for Elasticsearch deployment scripts

These Open Distro for Elasticsearch deployment scripts are excerpted from production repository, and were tested running OK. Below are the production resources configuration:

* Hardware, 3 * x86 Servers (40*2 Cores, 3.1GHz, 512G memory, 44T hard disk) 
* Software, CentOS 7.6, Docker Swarm CE 20.10.5

7 ES nodes is designed in one physical server, including 1 Master node, 1 coordinating node, 1 ingest node and 4 data nodes. 

The logic architecture diagram is as below:
(https://github.com/marshell0/opendistro-deployment/blob/master/image/logic.png)

Logstash running as independent docker in host mode, because we need retrieve the client source IP address, and nginx introduced for load balance accordingly; you can run it as a global docker service if no source IP required, then no nginx required as docker swarm internal load balance will be used.

Opendistro image used in the docker-compose.yml is a customized image, with some security configuration files packed inside, such as config.yml with LDAP support, keystore with email username and password added, common certificate files, customized alerting and notification jar files, which you can reference to (https://github.com/marshell0/alerting/releases)

Folder of the script files:
* etc, server host import configurations file need to be set for OpenDistro
* logstash, logstash configuration and pipeline files
* nginx, nginx configuration file and start up script
* script, some scripts for Docker swarm environment prepare
* ssl-key, public/private key generation script
* util, services deployment/undeployment/status check script

The deployment architecture diagram is as below:
(https://github.com/marshell0/opendistro-deployment/blob/master/image/deployment.png)

## Security issue notifications

If you discover a potential security issue in this project we ask that you notify us via email


## Licensing

See the [LICENSE](./LICENSE.txt) file for our project's licensing. We will ask you to confirm the licensing of your contribution.


## Copyright

Copyright 2016-2021 ubssdic.com, Inc. or its affiliates. All Rights Reserved.
