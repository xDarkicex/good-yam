#!/usr/bin/env bash

set -e
set -o pipefail
set -v

curl -s -X POST https://api.stackbit.com/project/5e768e718cd40a0019dc913f/webhook/build/pull > /dev/null
npx @stackbit/stackbit-pull --stackbit-pull-api-url=https://api.stackbit.com/pull/5e768e718cd40a0019dc913f
curl -s -X POST https://api.stackbit.com/project/5e768e718cd40a0019dc913f/webhook/build/ssgbuild > /dev/null
hugo
curl -s -X POST https://api.stackbit.com/project/5e768e718cd40a0019dc913f/webhook/build/publish > /dev/null
