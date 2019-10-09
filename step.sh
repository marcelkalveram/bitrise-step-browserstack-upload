#!/bin/bash
set -e
set -x
RESPONSE="$(curl -u $browserstack_username:$browserstack_access_key -X POST https://api-cloud.browserstack.com/app-automate/upload -F file=@$upload_path -F 'data={"custom_id": "'$custom_id'"}')"
echo "$RESPONSE" | jq -j '.app_url' | envman add --key BROWSERSTACK_APP_URL
