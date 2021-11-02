#!/bin/bash

cd "$(dirname "$0")"

# mysql:
echo -e '\x1b[37;41m clear database... \x1b[m'

find sql -name "crypto_*.sql" | sort | xargs -I {} sh -c "mysql -u root --password=password < {}"
find sql -name "init-*.sql" | sort | xargs -I {} sh -c "mysql -u root --password=password < {}"
