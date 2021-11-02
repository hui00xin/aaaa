#!/bin/bash

cd "$(dirname "$0")"

export JAVA_HOME=`/usr/libexec/java_home -v 11`
sh check-java-version.sh

cd kafka

echo "bin/kafka-server-start.sh config/server.properties"

bin/kafka-server-start.sh config/server.properties
