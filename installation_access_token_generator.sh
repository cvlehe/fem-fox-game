#!/bin/bash

INSTALLATION_ACCESS_TOKEN=$(curl -X POST \
-H "Authorization: Bearer $1" \
-H "Accept: application/vnd.github.v3+json" \
https://api.github.com/app/installations/15503724/access_tokens | ./node_modules/node-jq/bin/jq -r '.token')

curl -i \
-H "Authorization: token $INSTALLATION_ACCESS_TOKEN" \
-H "Accept: application/vnd.github.v3+json" \
https://api.github.com/installation/repositories