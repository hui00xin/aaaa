#!/bin/bash

cd "$(dirname "$0")"

# kill java:
echo -e '\x1b[37;41m kill all java processes for crypto... \x1b[m'
ps aux | grep highdax | grep Application | awk '{print $2}' | xargs -I {} sh -c "echo 'kill -9 {}'"
ps aux | grep highdax | grep Application | awk '{print $2}' | xargs kill -9
ps aux | grep highdax | grep Application

echo -e '\x1b[37;41m done \x1b[m'
