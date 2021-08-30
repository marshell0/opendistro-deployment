# !/bin/bash
node_name=$1
if [[ -z $1 ]]; then
  node_name="node"
fi

openssl x509 -subject -nameopt RFC2253 -noout -in "${node_name}.pem"
