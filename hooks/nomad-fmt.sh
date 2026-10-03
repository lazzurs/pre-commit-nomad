#!/usr/bin/env bash

# Workaround for PATH issues in some macOS GUI applications
original_path=$PATH
export PATH=$PATH:/usr/local/bin

FMT_ERROR=0

# Accumulate per-file errors so one invalid file does not stop the
# remaining files from being formatted and reported.
for file in "$@"; do
  nomad fmt "$file" || FMT_ERROR=$?
  nomad fmt -check "$file" || FMT_ERROR=$?
done

# reset path to the original value
export PATH=$original_path

exit ${FMT_ERROR}
