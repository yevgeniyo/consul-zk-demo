#!/bin/bash

# Getting PRIVATE IP of container
PRIVATE_IP_ADDRESS=$(dig $HOSTNAME +short)

# Setting tag for every service, with help of this tag we will have URL per server
sed -i 's/application/'"$HOSTNAME"'/g' /etc/consul.d/zk.json

# # # # Starting Zk
# bash /docker-entrypoint.sh
# /apache-zookeeper-3.6.0-bin/bin/zkServer.sh start-foreground &


# Starting Consul Client Agent
consul agent -bind $PRIVATE_IP_ADDRESS \
    -advertise $PRIVATE_IP_ADDRESS \
    -join consul-server-1 \
    -node $HOSTNAME \
    -dns-port 53 \
    -data-dir /data \
    -config-dir /etc/consul.d \
    -enable-local-script-checks &

# Starting Zk
bash /docker-entrypoint.sh
/apache-zookeeper-3.6.0-bin/bin/zkServer.sh start-foreground