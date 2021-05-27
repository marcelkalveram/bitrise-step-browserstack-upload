#!/bin/bash
set -e
set -x
curl -u "$browserstack_username:$browserstack_access_key" -X POST https://api-cloud.browserstack.com/app-live/upload -F "file=@$upload_path" -F 'data={"custom_id": "'$custom_id'"}' | jq -j '.app_url' | envman add --key BROWSERSTACK_APP_URL
