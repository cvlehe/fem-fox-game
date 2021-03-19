#!/bin/bash

INSTALLATION_ACCESS_TOKEN=$(curl -X POST \
-H "Authorization: Bearer $1" \
-H "Accept: application/vnd.github.v3+json" \
https://api.github.com/app/installations/15503724/access_tokens | ./node_modules/node-jq/bin/jq -r '.token')

# curl -i \
# -H "Authorization: token $INSTALLATION_ACCESS_TOKEN" \
# -H "Accept: application/vnd.github.v3+json" \
# https://api.github.com/installation/repositories

# # curl -i \
# # -H "Authorization: token $INSTALLATION_ACCESS_TOKEN" \
# # -H "Accept: application/vnd.github.v3+json" \
# # https://api.github.com/repos/cvlehe/fem-fox-game/branches

curl \
  -X POST \
  -H "Authorization: token $INSTALLATION_ACCESS_TOKEN" \
  -H "Accept: application/vnd.github.v3+json" \
  https://api.github.com/repos/cvlehe/fem-fox-game/pulls \
  -d '{"head":"test/automated-pr","base":"test/automated-pr-master"}'