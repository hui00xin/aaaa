#!/bin/bash

cd "$(dirname "$0")"
cd kafka

echo "bin/zookeeper-server-start.sh config/zookeeper.properties"

nohup bin/zookeeper-server-start.sh config/zookeeper.properties > nohup-zookeeper.log 2>&1 &
