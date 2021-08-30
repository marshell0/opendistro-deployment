# !/bin/sh
# Generate Node cert with the parameter provoided
node_name=$1
if [[ -z $1 ]]; then
  node_name="node"
fi

openssl genrsa -out node-key-temp.pem 2048
openssl pkcs8 -inform PEM -outform PEM -in node-key-temp.pem -topk8 -nocrypt -v1 PBE-SHA1-3DES -out "${node_name}-key.pem"
openssl req -new -key "${node_name}-key.pem" -out "${node_name}.csr" -nodes -config "${node_name}.cnf"
# openssl req -x509 -nodes -days 730 -newkey rsa:2048 -keyout cert.pem -out cert.pem -config coordinating-1.cnf  -extensions 'v3_req'
openssl x509 -days 3650 -req -in "${node_name}.csr" -CA root-ca.pem -CAkey root-ca-key.pem -CAcreateserial -sha256 -out "${node_name}.pem" -extensions 'v3_req' -extfile "${node_name}.cnf"
# openssl x509 -days 3650 -req -in "${node_name}.csr" -CA root-ca.pem -CAkey root-ca-key.pem -CAcreateserial -sha256 -out "${node_name}.pem" -extfile "${node_name}.cnf"
rm -f node-key-temp.pem
