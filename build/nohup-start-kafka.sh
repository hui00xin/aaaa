#!/bin/bash

cd "$(dirname "$0")"
cd kafka

echo "bin/kafka-server-start.sh config/server.properties"

nohup bin/kafka-server-start.sh config/server.properties > nohup-kafka.log 2>&1 &
