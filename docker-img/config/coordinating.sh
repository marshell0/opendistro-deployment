#!/bin/sh

if [[ $HOSTNAME == 'coordinating' ]]; then
    echo ">>>> Coordinating node security initialization <<<<"
    # use while loop to check if elasticsearch is running 
    while true
    do
        netstat -uplnt | grep :9300 | grep LISTEN > /dev/null
        verifier=$?
        if [ 0 = $verifier ]
            then
                echo "Running securityadmin script"
                chmod +x /usr/share/elasticsearch/plugins/opendistro_security/tools/securityadmin.sh
                /usr/share/elasticsearch/plugins/opendistro_security/tools/securityadmin.sh -cacert /usr/share/elasticsearch/config/root-ca.pem -cert /usr/share/elasticsearch/config/admin.pem -key /usr/share/elasticsearch/config/admin-key.pem -h coordinating -cn udic-odfe -nhnv -f /usr/share/elasticsearch/plugins/opendistro_security/securityconfig/config.yml -t config
                break
            else
                echo "Elasticsearch is not running yet"
                sleep 5
        fi
    done
fi

