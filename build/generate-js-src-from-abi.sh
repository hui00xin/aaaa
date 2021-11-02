#!/usr/bin/env bash

# generate file name:

declare -a CONTRACTS=("IDexWallet" "IErc")

cd "$(dirname "$0")"

APP_PATH=`pwd`
SRC_PATH="$APP_PATH/../blockchain/src/main/resources/abi"
JS_OUT_FILE="$APP_PATH/../ui/static/abis.js"

echo "set app dir: $APP_PATH"
echo "set src dir: $SRC_PATH"
echo "set js out dir: $JS_OUT_FILE"

echo "// AUTO generate abi" > $JS_OUT_FILE
echo "window.abis = {}" >> $JS_OUT_FILE

for C in "${CONTRACTS[@]}"
do
    echo "write abi $C to $JS_OUT_FILE..."
    echo -n "window.abis.$C = " >> $JS_OUT_FILE
    more $SRC_PATH/$C.json | tr -d " " | tr -d "\n" >> $JS_OUT_FILE
    echo "" >> $JS_OUT_FILE
done
