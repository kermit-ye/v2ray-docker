#!/bin/bash

if [ ! -f "/v2ray/config.json" ];then
  TOKEN=$(cat /proc/sys/kernel/random/uuid)
  echo "token is "$TOKEN
  sed -e "s/##token##/${TOKEN}/" /v2ray/config-temp.json > /v2ray/config.json
fi
/v2ray/v2ray -config /v2ray/config.json
