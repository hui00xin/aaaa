#!/usr/bin/env bash
#
# Requirement:
# Web3j 1.4.1
#
# $ web3j -version
# by Web3Labs
# Version: 1.4.1
# Build timestamp: 2021-02-16 20:28:33.742 UTC
#

# generate file name:

declare -a CONTRACTS=("IDexWallet" "IErc")

cd "$(dirname "$0")"

APP_PATH=`pwd`
SRC_PATH="$APP_PATH/../blockchain/src/main/resources/abi"
JAVA_OUT_PATH="$APP_PATH/../blockchain/src/main/java"

PACKAGE="com.highdax.crypto.web3gen"

echo "set app dir: $APP_PATH"
echo "set src dir: $SRC_PATH"
echo "set java out dir: $JAVA_OUT_PATH"

for C in "${CONTRACTS[@]}"
do
    echo "generate for $C..."
    web3j generate solidity -a=$SRC_PATH/$C.json -o=$JAVA_OUT_PATH -p=$PACKAGE
done
