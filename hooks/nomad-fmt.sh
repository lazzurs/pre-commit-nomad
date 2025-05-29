#!/usr/bin/env bash

set -e

# Workaround for PATH issues in some macOS GUI applications
original_path=$PATH
export PATH=$PATH:/usr/local/bin

FMT_ERROR=0

for file in "$@"; do
  nomad fmt -check "$file" || FMT_ERROR=$?
done

# reset path to the original value
export PATH=$original_path

exit ${FMT_ERROR}
