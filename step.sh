#!/bin/bash
RESPONSE="$(curl -u $browserstack_username:$browserstack_access_key -X POST https://api-cloud.browserstack.com/app-automate/upload -F file=@$upload_path --speed-time 10 --speed-limit 1000)"
echo "$RESPONSE" | jq -j '.app_url' | envman add --key BROWSERSTACK_APP_URL
