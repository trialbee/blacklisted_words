#!/bin/bash
set -e

if [[ -z $BLACKLISTED_AD_WORDS_META_URL || -z $BLACKLISTED_AD_WORDS_META_TOKEN ]];then
  echo "Both BLACKLISTED_AD_WORDS_META_URL and BLACKLISTED_AD_WORDS_META_TOKEN must be set!"
  echo "Exiting..."
  exit 1
fi

echo 'Sending POST request to meta-secretary'
curl -X POST -d \
'{
  "deployment": {
    "commit_sha": "'$(git rev-parse HEAD)'",
    "tag": "'$(git describe)'",
    "server": "production",
    "application": "blacklisted_words",
    "repository_name": "blacklisted_words",
    "ip_address": ""
  }
}' $BLACKLISTED_AD_WORDS_META_URL/new_deployment  --header "Authorization: Token token=$BLACKLISTED_AD_WORDS_META_TOKEN" --header "Content-Type:application/json" \
&& echo 'POST request sent' || echo "POST request to $BLACKLISTED_AD_WORDS_META_URL/new_deployment failed"
echo "Pushing master branch to heroku"
git push heroku master
