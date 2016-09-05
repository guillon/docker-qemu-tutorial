#!/usr/bin/env bash
set -euo pipefail

dir="$(dirname "$0")"
docker build -t guillon/dev-qemu-tutorial \
    ${http_proxy:+--build-arg http_proxy} \
    ${https_proxy:+--build-arg https_proxy} \
    ${no_proxy:+--build-arg no_proxy} \
    "$dir"

