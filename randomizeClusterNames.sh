#!/bin/env bash
set -euo pipefail

sed -e "s/\(eduffy-\)[0-9a-z]\{5\}-/\1$(dd if=/dev/urandom bs=256 count=1 | md5sum | cut -c -5)-/g" -i overrides/values-cluster-names.yaml
