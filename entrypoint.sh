#!/usr/bin/env bash
set -euo pipefail

if [ $# -gt 0 ] && [ "$1" != "--" ]; then
    exec "$@"
fi

cd /home/hacker

[ -d qemu-tutorial ] || cp -a /qemu-tutorial qemu-tutorial

echo ""
echo "    Welcome to the JCF11 QEMU Tutorial"
echo ""
echo "    You're running bash into a Ubuntu 14.04 container as user 'hacker'."
echo ""
echo "  You may check your install with:"
echo "  > check-install.sh"
echo "    which should dump a binary search call trace."
echo ""
exec bash
