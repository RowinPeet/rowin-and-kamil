#!/usr/bin/env bash

set -e
set -o pipefail
set -v

curl -s -X POST https://api.stackbit.com/project/5db6f9074a21550013bb7464/webhook/build/pull > /dev/null
npx @stackbit/stackbit-pull --stackbit-pull-api-url=https://api.stackbit.com/pull/5db6f9074a21550013bb7464
curl -s -X POST https://api.stackbit.com/project/5db6f9074a21550013bb7464/webhook/build/ssgbuild > /dev/null
gatsby build
curl -s -X POST https://api.stackbit.com/project/5db6f9074a21550013bb7464/webhook/build/publish > /dev/null
