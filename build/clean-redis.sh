#!/bin/bash

cd "$(dirname "$0")"

echo -e '\x1b[37;41m clear redis... \x1b[m'

redis-cli flushall
