# base on official image
FROM nexus.ubssdic.com:8445/amazon/opendistro-for-elasticsearch:1.13.1
LABEL maintainer="xuening.ma"

COPY ./util/nexus.repo /etc/yum.repos.d/
# COPY ./util/docker-gpg /etc/pki/rpm-gpg/docker-gpg
# COPY ./util/RPM-GPG-KEY-CentOS-7 /etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7

ENV TZ=Asia/Shanghai

RUN rm -f /etc/yum.repos.d/CentOS*.repo /etc/yum.repos.d/ep*.repo \
    && yum update -y  \
    && yum -y install kde-l10n-Chinese \
    && yum install -y telnet net-tools \
    && yum clean all \
    && rm -rf /tmp/* rm -rf /var/cache/yum/* \
    && localedef -i zh_CN -f UTF-8 zh_CN.UTF-8 \
    && ln -sf /usr/share/zoneinfo/$TZ /etc/localtime && echo "$TZ" > /etc/timezone

ENV LANG=zh_CN.UTF-8 \
    LC_ALL=zh_CN.UTF-8 \
    LC_CTYPE=zh_CN.UTF-8 \
    LC_MESSAGES=zh_CN.UTF-8

COPY --chown=elasticsearch:elasticsearch ./config/config.yml ./config/internal_users.yml ./config/roles_mapping.yml /usr/share/elasticsearch/plugins/opendistro_security/securityconfig/
COPY --chown=elasticsearch:elasticsearch ./config/elasticsearch.yml ./config/elasticsearch.keystore ./config/log4j2.properties ./ssl-key/root-ca.pem ./ssl-key/admin.pem ./ssl-key/admin-key.pem /usr/share/elasticsearch/config/
COPY --chown=elasticsearch:elasticsearch ./config/default.policy /opt/jdk/lib/security/default.policy
COPY --chown=elasticsearch ./config/coordinating.sh ./config/docker-entrypoint.sh /usr/local/bin/
COPY --chown=elasticsearch ./config/performance-analyzer.properties /usr/share/elasticsearch/plugins/opendistro-performance-analyzer/pa_config/
COPY --chown=elasticsearch:elasticsearch ./lib/opendistro-alerting-1.13.1.0.jar /usr/share/elasticsearch/plugins/opendistro-alerting/opendistro-alerting-1.13.1.0.jar
COPY --chown=elasticsearch:elasticsearch ./lib/alerting-notification-1.13.1.0.jar /usr/share/elasticsearch/plugins/opendistro-alerting/alerting-notification-1.13.1.0.jar
ADD  --chown=elasticsearch:elasticsearch ./lib/analysis-ik/ /usr/share/elasticsearch/plugins/analysis-ik/
COPY ./util/netstat /usr/bin/

ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]
# Dummy overridable parameter parsed by entrypoint
CMD ["eswrapper"]
