#!/bin/bash
set -ex

echo "we need the app's APK path: $apk_path"
echo "we need a BrowserStack username: $browserstack_username"
echo "we need a BrowserStack password: $browserstack_password"

RESPONSE="$(curl -u $browserstack_username:$browserstack_password -X POST https://api-cloud.browserstack.com/app-automate/upload -F file=@$apk_path)"
echo "response is: $RESPONSE"

echo "$RESPONSE" | jq --raw-output '.app_url' | envman add --key BROWSERSTACK_APP_URL