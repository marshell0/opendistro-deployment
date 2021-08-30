# Root CA
openssl genrsa -out root-ca-key.pem 2048
openssl req -days 3650 -new -x509 -sha256 -key root-ca-key.pem -out root-ca.pem
