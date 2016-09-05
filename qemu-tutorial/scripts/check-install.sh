#!/usr/bin/env bash
set -euo pipefail

dir="$(dirname "$0")"

trap "rm -f /tmp/bsearch-rec.$$.ftrace.yml*" INT EXIT

cd "$dir"/..

echo "building bsearch-rec"
(set -x; make -C src bsearch-rec)

echo "Executing qemu with ftrace plugin"
(set -x; env TPI_OUTPUT=/tmp/bsearch-rec.$$.ftrace.yml qemu-x86_64 -tcg-plugin ftrace src/bsearch-rec 24)
    
echo "Outputing functions entries/returns for the main program"
cat /tmp/bsearch-rec.$$.ftrace.yml | \
    grep bsearch-rec | \
    grep -e call_entry -e call_return
