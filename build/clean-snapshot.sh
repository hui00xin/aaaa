#!/bin/bash

cd "$(dirname "$0")"


echo -e '\x1b[37;41m clear snapshots... \x1b[m'

echo 'clean snapshots in /var/data/spots-snapshot/...'
rm -rf /var/data/spots-snapshot/*.gz

echo 'clean snapshots in /var/data/contracts-snapshot/...'
rm -rf /var/data/contracts-snapshot/*.gz
