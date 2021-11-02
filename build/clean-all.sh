#!/bin/bash

cd "$(dirname "$0")"

sh clean-redis.sh
sh clean-snapshot.sh
sh clean-db.sh
sh clean-topics.sh

echo -e -n '\x1b[37;41m done at '
echo -n `date`
echo -e ' \x1b[m'
