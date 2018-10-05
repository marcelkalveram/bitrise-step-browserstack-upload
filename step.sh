#!/bin/bash
set -ex

echo "we need the app's APK path: $upload_path"
echo "we need a BrowserStack username: $browserstack_username"
echo "we need a BrowserStack password: $browserstack_access_key"

RESPONSE="$(curl -u $browserstack_username:$browserstack_access_key -X POST https://api-cloud.browserstack.com/app-automate/upload -F file=@$upload_path)"
echo "response is: $RESPONSE"

echo "$RESPONSE" | jq -j '.app_url' | envman add --key BROWSERSTACK_APP_URL