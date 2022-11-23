#!/bin/bash

echo "===== Starting mongodb, elasticsearch, rabbitmq ====="

source  /usr/local/bin/mongo-docker-entrypoint.sh mongod --quiet &
source  /usr/local/bin/node-docker-entrypoint.sh node --silent &
source  /usr/local/bin/rabbit-docker-entrypoint.sh rabbitmq-server &
source  /usr/local/bin/es-docker-entrypoint.sh eswrapper &

es_response_code=$(curl -s -o /dev/null -w "%{http_code}" http://localhost:9201)
while [[ -z $(pgrep mongod) || -z $(pgrep rabbitmq-server) || $es_response_code != 200 ]]; do
    echo "waiting for mongodb, elasticsearch, rabbitmq to be up ..... rechecking in 5s"
    sleep 5
    es_response_code=$(curl -s -o /dev/null -w "%{http_code}" http://localhost:9201)
done
sleep 20;
echo "127.0.0.1 rabbitmq" >> /etc/hosts
echo "######### SERVICES UP #########"