#!/bin/env bash
set -euo pipefail

for f in $(grep -r "\(eduffy-\)\S*\(-primary\|-secondary\)" --include="*.yaml" | cut -d ':' -f 1 | sort -u); do
	sed -e "s/\(eduffy-\)\S*\(-primary\|-secondary\)/\1$(dd if=/dev/urandom bs=256 count=1 | md5sum | cut -c -5)\2/g" -i "$f"
done
# sed -e "s/\(eduffy-\)[0-9a-z]\{5\}-/\1$(dd if=/dev/urandom bs=256 count=1 | md5sum | cut -c -5)-/g" -i overrides/values-cluster-names.yaml
